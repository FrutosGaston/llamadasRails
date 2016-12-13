class LocationsController < ApplicationController
  def new
  end

  def index
    @locations = LocationExpert.all_possible_locations
  end

  def show
    @location = LocationExpert.find_location_by_id(params[:id])
  end

  def create
    @location = Location.new(args)

    LocationExpert.add_location(@location)
    redirect_to @location
  end

  def args
    params.require(:location).permit(:pais, :ciudad)
  end

end