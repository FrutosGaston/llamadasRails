class Bill < ApplicationRecord
  belongs_to :biller

  def calls
    Call.where(when: since..till)
  end

  def total_amount
    biller.costo_total_llamadas(calls)
  end

end
