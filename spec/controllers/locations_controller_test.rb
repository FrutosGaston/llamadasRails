require 'rails_helper'



describe do

  let(:location_params) do
    {
        pais: 'AR', ciudad: 'BSAS',
    }
    end

  it ' ' do

    @controller = LocationsController.new
    post :create, location: location_params

    expect(response.status).to eq 302
    expect(Location.count).to eq 1
  end

end