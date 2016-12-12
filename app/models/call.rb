class Call < ActiveRecord::Base

  belongs_to :origin, :class_name => 'Location', foreign_key: :origin_id
  belongs_to :destination, :class_name => 'Location', foreign_key: :destination_id

    def es_dia_de_semana?
      ! es_fin_de_semana?
    end

    def done_between(ssince, ntil)
      when_was > ssince && when_was < ntil
    end

    def es_horario_laboral?
      (when_was.hour > 8) & (when_was.hour < 20)
    end
    def es_fin_de_semana?
      when_was.saturday? || when_was.sunday?
    end

    def es_horario_no_laboral?
      (when_was.hour <= 8) & (when_was.hour <= 20)
    end

    def es_nacional?
      origin.es_mismo_pais?(destination)
    end

    def es_local?
      es_nacional? && origin.es_misma_ciudad?(destination)
    end

    def es_internacional?
      ! es_nacional?
    end

    def llamada_a_europa?
      destination.es_pais?('Europe')
    end

    def llamada_a_norteamerica?
      destination.es_region?('Northern America')
    end

    def llamada_a_sudamerica?
      destination.es_region?('South America')
    end

end
