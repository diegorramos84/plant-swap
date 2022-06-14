require_relative 'plants_controller'
class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @plant = Plant.find(params[:plant_id])
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.plant_id = @plant.id
    @booking.user_id = @user.id
    if @booking.save!
      @chatroom = Chatroom.create(name: "#{@plant.common_name}-Swap Chat", booking_id: @booking[:id])
	    redirect_to bookings_path(@plant)
    else
      render :new
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
    @plants = Plant.where(user: current_user)
    @bookings_seller = Booking.joins(:plant).where(plant: { user_id: current_user })
  end

  def booking_params
    params.require(:booking).permit(:buy_status, :plant_id, :booking_quantity, :status, :format, :chatroom, :id)
  end

  def reply_buy
    @booking = Booking.find(params[:format])
    @booking.buy_status = params[:status]
    @booking.save
    @plant_controller = PlantsController.new
    @bookings_seller = Booking.joins(:plant).where(plant: { user_id: current_user })
    if params[:status] == 'accepted'
      @bookings_seller.each do |booking|
        if booking.buy_status == 'accepted'
          @plant = booking.plant
          @plant.quantity -= booking.booking_quantity
          @plant.save!
          @booking = booking
          @booking.buy_status = 'completed'
          @booking.save!
        end
      end
    elsif params[:status] == 'rejected'
      @booking.buy_status = 'rejected'
      @booking.save!
    end
      redirect_to bookings_path, notice: "Order status changed to #{params[:status]}"
  end

  # def destroy
    # @booking.destroy
    # redirect_to bookings_path, status: :see_other
  # end
end
