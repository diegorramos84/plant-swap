class UsersController < ApplicationController
  def show
    @review = Review.new
    @user = User.find(params[:id])
  end
end
