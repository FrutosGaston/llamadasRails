class Location < ApplicationRecord

  has_one :pais
  has_one :ciudad

  attr_accessor :ciudad
  attr_accessor :pais


  def initialize(pais, ciudad)

    @pais = ISO3166::Country.new(pais)
    @ciudad = ciudad

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
