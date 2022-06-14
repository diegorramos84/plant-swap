class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save!
      redirect_to user_path(@booking.plant.user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
