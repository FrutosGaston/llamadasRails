class CostoDeLlamada

  def initialize(costo, condicion)
    @costo = costo
    @condicion = condicion
  end

  def costo_total(llamada)
    costo = costo_por_minuto * llamada.last
  end

  def costo_por_minuto()
    @costo
  end

  def puede_hacerse_cargo(llamada)
    @condicion.call(llamada)
  end

end