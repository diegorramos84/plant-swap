class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @plants = @user.plants
  end
end
