class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      @plants = Plant.search_by_name_type_and_category(params[:query])
    else
      @plants = Plant.all
    end
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save!
      redirect_to user_path(@plant.user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @marker = [{ lat: @plant.user.geocode[0], lng: @plant.user.geocode[1], image_url: helpers.asset_url("spider-plant.png") },
               { lat: current_user.geocode[0], lng: current_user.geocode[1], image_url: helpers.asset_url("house.png") }]
    @user = @plant.user
    @bookings = @user.bookings
  end

  def edit
  end

  def update
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to user_path(@plant.user_id), status: :see_other
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:category, :plant_type, :botanical_name, :common_name, :description, :light_conditions,
                                  :mature_height, :quantity, :indoor, :photo, :user_id)
  end
end
