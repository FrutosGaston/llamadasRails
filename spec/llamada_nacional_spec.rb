require 'rails_helper'
require_relative '../app/models/costo_de_llamada'

describe do

  before(:each) do
    @costo_nacional = CostoDeLlamada.new(0.3, -> (llamada){ llamada.es_nacional?})

    @llamada = FactoryGirl.build(:call)
  end

  it 'The cost per minute in a national call sould be 0.3' do
    expect(@costo_nacional.costo_por_minuto).to be 0.3
  end


  it 'The total cost in a national call of 2 minutes should be 0.6' do
    expect(@costo_nacional.costo_total(@llamada)).to be 0.3*2
  end

end