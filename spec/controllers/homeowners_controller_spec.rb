require 'rails_helper'

RSpec.describe HomeownersController, type: :controller do
  context 'GET #show' do
    it 'returns a success response' do
      homeowner = Homeowner.create!(first_name: "John", password: 'yooo')
      get :show, params: { id: homeowner.to_param }
      expect(response).to be_successful
    end
  end
end
