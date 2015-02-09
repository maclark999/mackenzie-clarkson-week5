class EventsController < ApplicationController
before_action :set_event, only: [:show, :edit, :update, :destroy]
before_action :set_location

  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @event = Event.new(event_params)
    @event.location_id = params[:location_id]
    if @event.save
      redirect_to location_path(@location), notice: "Location was successfully created!"
    end
  end

  def show
  end

  def edit

  end

  def update
    if @event.save
      redirect_to @location
    end
  end

  def destroy
    if @event.destroy
      redirect_to location_path
    end
  end

private
  def set_event
    @event = Event.find(params[:id])
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def event_params
    params.require(:event).permit(:description, :date, :requires_id, :location_id)
  end


end
