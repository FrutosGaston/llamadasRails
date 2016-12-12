class BillsController < ApplicationController

  def create
    @biller = Biller.find(params[:biller_id])
    @bill = @biller.bills.create(args)

    redirect_to biller_path(@biller)
  end

  private
  def args
    params.require(:bill).permit(:since, :till)
  end

end
