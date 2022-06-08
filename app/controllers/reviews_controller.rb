class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.save
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
