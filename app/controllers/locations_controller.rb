class LocationsController < ApplicationController
before_action :set_location, only: [:show, :edit, :update, :destroy]
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    @events = Location.find(params[:id]).events
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render ('new')
    end
  end

  def edit

  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      redirect_to location_path(@location)
    end
  end

  def destroy
    if @location.destroy
      redirect_to locations_path, notice: "Are you sure?"
    end
  end

private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :address, :zipcode)
    end

end
