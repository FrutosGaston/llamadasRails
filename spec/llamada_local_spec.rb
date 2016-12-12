require 'rails_helper'

describe do

  before(:each) do
    destino = Location.new({pais: ISO3166::Country.new('US'), ciudad: 'NY'})

    @llamada = FactoryGirl.build(:call, destination: destino)

    @costo_local_habil = CostoDeLlamada.new(0.2, ->(llamada) { llamada.es_local? && llamada.es_dia_de_semana? & llamada.es_horario_laboral?})
    @costo_local_no_habil = CostoDeLlamada.new(0.1, ->(llamada){llamada.es_local? &&  llamada.es_fin_de_semana? || llamada.es_horario_no_laboral? })
  end

  it 'sadd' do
    @llamada.when_was = dia_habil

    expect(@costo_local_habil.costo_por_minuto).to be 0.2
  end

  it 'ddhf' do
    @llamada.when_was = fin_de_semana

    expect(@costo_local_no_habil.costo_por_minuto).to be 0.1
  end

  it 'gsd' do
    @llamada.when_was = dia_semana_madrugada

    expect(@costo_local_no_habil.costo_por_minuto).to be 0.1
  end

  it ' asd' do
    @llamada.when_was = dia_habil
    minutos = 5

    @llamada.last = minutos

    expect(@costo_local_habil.costo_total(@llamada)).to be 0.2 * minutos
  end





  def dia_habil
    DateTime.new(2016,11,30,11,1,1,'+7')
  end

  def dia_semana_madrugada
    DateTime.new(2016,11,30,4,1,1,'+7')
  end

  def fin_de_semana
    DateTime.new(2016,11,27,11,1,1,'+7')
  end

end