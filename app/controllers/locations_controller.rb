class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path
    else
      render ('new')
    end
  end

  def edit
  end

private
    def location_params
      params.require(:location).permit(:name, :address, :zip_code)
    end

end