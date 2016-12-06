class BillsController < ApplicationController

  def create
    @biller = Biller.find(params[:biller_id])
    @bill = @biller.bills.create(args, Call.all)

    redirect_to biller_path(@biller)
  end

  private
  def args
    params.require(:bills).permit(:since, :until, :amount, :calls)
  end

end
