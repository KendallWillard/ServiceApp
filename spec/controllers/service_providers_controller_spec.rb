require 'rails_helper'

RSpec.describe ServiceProvidersController, type: :controller do

  context 'GET #show' do
    it 'returns a success response' do
      service_provider = ServiceProvider.create!(name: 'This is the post', password: 'yooo')
      get :show, params: { id: service_provider.to_param }
      expect(response).to be_successful
    end
  end
end
