class LocationsController < ApplicationController
  def new
  end

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(args)

    @location.save
    redirect_to @location

    #render plain: @location.pais
  end

  def args
    params.require(:location).permit(:pais, :ciudad)
  end

end

