class BillsController < ApplicationController

  def create
    @bill = Bill.new(args)

    BillFolder.add_bill(@bill)

    redirect_to bills_path
  end

  def destroy
    @bill = Bill.find(params[:id])
    BillFolder.remove_bill(@bill)

    redirect_to bills_path
  end

  private
  def args
    params.require(:bill).permit(:since, :till)
  end

end
