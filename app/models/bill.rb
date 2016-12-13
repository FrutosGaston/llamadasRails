class Bill < ApplicationRecord

  def calls
    CallsRecord.between(since, till)
  end

  def total_amount
    Biller.new(CostosDeLlamadaBasicos.new.tipos_de_costo).total_amount(calls)
  end

end
