class ReviewsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @user = @plant.user
    @review = Review.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @user = @plant.user
    @review = Review.new(review_params)
    @review.user = @user
    @review.save
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
