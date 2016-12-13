class Biller

  attr_accessor :bills

  def initialize(cost_types)
    @cost_types = cost_types
  end

  def total_amount(calls)
    calls.reduce(0) { |acumulador, call| acumulador += call_amount(call) }
  end

  def call_amount(llamada)
    call_type(llamada).costo_total(llamada)
  end

  private

  def call_type(llamada)
    @cost_types.detect { |tipo| tipo.puede_hacerse_cargo(llamada)}
  end

end
