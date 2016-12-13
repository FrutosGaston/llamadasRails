class CallsController < ApplicationController
  def new
  end

  def index
    @calls = CallsRecord.all
  end

  def show
    @call = CallsRecord.find(params[:id])
  end

  def create
    @call = Call.new(args)

    CallsRecord.add_call(@call)
    redirect_to @call
  end

  private

  def args
    params.require(:call).permit(:origin_id, :destination_id, :when_was, :last)
  end

end
