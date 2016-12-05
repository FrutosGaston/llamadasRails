class Call < ActiveRecord::Base

  has_many :locations

  def initialize(params)
    super
    write_attribute(:origin, params[:origin])
    write_attribute(:destiny, params[:destiny])
    write_attribute(:when, params[:when])
    write_attribute(:last, params[:last])
  end

    def es_dia_de_semana?
      ! es_fin_de_semana?
    end

    def es_horario_laboral?
      (@when.hour > 8) & (@when.hour < 20)
    end

    def es_fin_de_semana?
      @when.saturday? || @when.sunday?
    end

    def es_horario_no_laboral?
      (@when.hour <= 8) & (@when.hour <= 20)
    end

    def es_nacional?
      @origin.es_mismo_pais?(@destiny)
    end

    def es_local?
      es_nacional? && @origin.es_misma_ciudad?(@destiny)
    end

    def es_internacional?
      ! es_nacional?
    end

    def llamada_a_europa?
      @destiny.es_pais?('Europe')
    end

    def llamada_a_norteamerica?
      @destiny.es_region?('Northern America')
    end

    def llamada_a_sudamerica?
      @destiny.es_region?('South America')
    end

end
