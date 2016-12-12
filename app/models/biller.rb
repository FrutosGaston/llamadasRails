class Biller < ApplicationRecord

  has_many :bills

  def total_amount(llamadas)
    llamadas.reduce(0) { |acumulador, llamada| acumulador += call_amount(llamada) }
  end

  def call_amount(llamada)
    call_type(llamada).costo_total(llamada)
  end

  private

  def call_type(llamada)
    cost_types.detect { |tipo| tipo.puede_hacerse_cargo(llamada)}
  end

end
