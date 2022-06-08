class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @user
    @review.save
  end

  def show
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
