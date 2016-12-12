require 'rails_helper'

describe do

  before(:each) do
    @tipos_de_costo = CostosDeLlamadaBasicos.new.tipos_de_costo

    @llamada = FactoryGirl.build(:call)

    @facturador = Biller.new(cost_types: @tipos_de_costo)
  end

  it 'A bill without calls should cost 10' do

    expect(@facturador.total_amount([])).to be 0
  end

  it 'A bill with a local NATIONAL call of 2 minutes should cost 0.6' do


    expect(@facturador.total_amount([@llamada])).to be 0.6
  end

  it 'A bill with a local LOCAL call of 2 minutes should cost 0.4' do

    origen = Location.new(ISO3166::Country.new('US'),'NY')
    destino = Location.new(pais: ISO3166::Country.new('US'),ciudad: 'NY')

    @llamada = Call.new(origen, destino ,2, DateTime.new(2016,11,30,11,1,1,'+7'))

    expect(@facturador.total_amount([@llamada])).to be 0.4
  end

  it 'A bill with a local INTERNATIONAL call of 2 minutes should cost 0.4' do

    origen = Location.new(ISO3166::Country.new('US'),'NY')
    destino = Location.new(ISO3166::Country.new('ZW'),'Kokonut')

    @llamada = Call.new(origen, destino ,2, DateTime.new(2016,11,30,11,1,1,'+7'))

    expect(@facturador.total_amount([@llamada])).to be 3.0
  end

  it 'A bill with a local INTERNATIONAL and a NATIONAL call of 2 minutes each one, should cost 3.6' do

    origen = Location.new(ISO3166::Country.new('US'),'NY')
    destino = Location.new(ISO3166::Country.new('ZW'),'Miami')

    llamada_nueva = Call.new(origen, destino ,2, DateTime.new(2016,11,30,11,1,1,'+7'))

    expect(@facturador.total_amount([@llamada, llamada_nueva])).to be 3.6
  end


end