class BillsController < ApplicationController

  def create
    @bill = Bill.new(args)

    @bill.save!

    redirect_to bills_path
  end

  private
  def args
    params.require(:bill).permit(:since, :till)
  end

end
