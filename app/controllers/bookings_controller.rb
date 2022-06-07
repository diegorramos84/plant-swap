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
      redirect_to renter_bookings_path(@plant)
    else
      render :new
    end
  end

  def buyer_bookings
    @bookings = Booking.all
  end

  def booking_params
    params.require(:booking).permit(:booking_status, :plant_id, :status, :format)
  end

  #  def reply_buy
  #  @booking = Booking.find(params[:format])
  #***  @booking.buy_status = params[:status]
  #  @booking.save
  #  redirect_to buyer_bookings_path, notice: "Rent status changed to #{params[:status]}"
  # end
end
