class Location < ActiveRecord::Base


  def initialize(params)
    super
    write_attribute(:pais, ISO3166::Country.new(params[:pais]))
    write_attribute(:ciudad, params[:ciudad])
  end

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
