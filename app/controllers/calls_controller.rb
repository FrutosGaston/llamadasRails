class CallsController < ApplicationController
  def new
  end

  def index
    @calls = Call.all
  end

  def show
    @call = Call.find(params[:id])
  end

  def create
    @call = Call.new(args)

    @call.save
    redirect_to @call
  end

  private
  def args
    params.require(:call).permit(:origin_id, :destination_id, :when_was, :last)
  end

end
