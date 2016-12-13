require 'rails_helper'



describe do

  it ' ' do

    @controller = CallsController.new
    post :create, call: FactoryGirl.attributes_for(:call)

    expect(response.status).to eq 302
    expect(Call.count).to eq 1
  end

end