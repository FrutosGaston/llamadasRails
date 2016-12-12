class Bill < ApplicationRecord

  def calls
    Call.where(when_was: since..till)
  end

  def total_amount
    Biller.new(CostosDeLlamadaBasicos.new.tipos_de_costo).total_amount(calls)
  end

end
