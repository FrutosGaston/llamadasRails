class BillersController < ApplicationController
  def new
  end

  def index
    @billers = Biller.all
  end

  def show
    @biller = Biller.find(params[:id])
  end

  def create
    @biller = Biller.new(args)

    @biller.save
    redirect_to @biller
  end

  private
  def args
    params.require(:biller).permit(:empresa)
  end

end
