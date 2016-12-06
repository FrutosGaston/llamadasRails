class Location < ActiveRecord::Base

  has_many :calls

  def pais_coma_ciudad
    pais.to_s + " , " + ciudad.to_s
  end

  def es_mismo_pais?(ubicacion)
    @pais == ubicacion.pais
  end

  def es_misma_ciudad?(ubicacion)
    @ciudad == ubicacion.ciudad
  end

  def es_pais?(pais)
    @pais.equal?(pais)
  end

  def es_region?(region)
    @pais.region.equal?(region)
  end

end
