require 'rails_helper'

describe do

  before(:each) do
    @tipos_de_costo = CostosDeLlamadaBasicos.new.tipos_de_costo

    @llamada = FactoryGirl.build(:call)

    @facturador = Biller.new(@tipos_de_costo)
  end

  it 'A bill without calls should cost 10' do

    expect(@facturador.total_amount([])).to be 0
  end

  it 'A bill with a local NATIONAL call of 2 minutes should cost 0.6' do


    expect(@facturador.total_amount([@llamada])).to eq 0.6
  end

  it 'A bill with a local LOCAL call of 2 minutes should cost 0.4' do

    destino = Location.new({pais: 'US', ciudad: 'NY'})
    @llamada.destination = destino

    expect(@facturador.total_amount([@llamada])).to be 0.4
  end

  it 'A bill with a local INTERNATIONAL call of 2 minutes should cost 0.4' do

    destino = Location.new({pais: 'ZW', ciudad: 'Kokonut'})
    @llamada.destination = destino

    expect(@facturador.total_amount([@llamada])).to be 3.0
  end

end