class LocationsController < ApplicationController
  def new
  end

  def create
    @location = Location.new(args[:pais],args[:ciudad])

    render plain: @location.pais
  end

  def args
    params.require(:location).permit(:pais, :ciudad)
  end

end
