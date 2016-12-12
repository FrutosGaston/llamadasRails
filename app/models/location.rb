class Location < ActiveRecord::Base

  has_many :calls

  def country
    ISO3166::Country.new(pais)
  end

  def pais_coma_ciudad
    country.name + " , " + ciudad.to_s
  end

  def es_mismo_pais?(ubicacion)
    country == ubicacion.country
  end

  def es_misma_ciudad?(ubicacion)
    ciudad == (ubicacion.ciudad)
  end

  def es_pais?(pais)
    country.equal?(pais)
  end

  def es_region?(region)
    country.subregion == region
  end

end
