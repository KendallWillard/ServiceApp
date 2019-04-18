require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
   context 'POST #create' do
     it 'user can log in' do
        
        post :create, params: {id: session.to_param }
        expect(response).to be_successful
      end
     end
end
