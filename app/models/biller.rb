class Biller

  attr_accessor :bills

  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  def initialize(cost_types)
    @cost_types = cost_types
  end

  def total_amount(llamadas)
    llamadas.reduce(0) { |acumulador, llamada| acumulador += call_amount(llamada) }
  end

  def call_amount(llamada)
    call_type(llamada).costo_total(llamada)
  end

  def bills
    Bill.all
  end

  private

  def call_type(llamada)
    @cost_types.detect { |tipo| tipo.puede_hacerse_cargo(llamada)}
  end

end
