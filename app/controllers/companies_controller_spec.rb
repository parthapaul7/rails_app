require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'when user is not authenticated' do
      it 'returns unauthorized status' do
        post :create, params: { name: 'Example Company', location: 'Example Location' }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when required parameters are missing' do
      it 'returns unprocessable entity status' do
        sign_in create(:user, role: :admin)
        post :create, params: { name: 'Example Company' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
