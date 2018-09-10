require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it 'returns user data if user is found' do
      user = create(:user)
      get :show, params: { email: user.email }
      user_hash = JSON.parse response.body
      expect(user_hash['email']).to eq user.email
    end

    it 'empty hash if nothing is found' do
      user = create(:user)
      get :show, params: { email: 'some random string' }
      user_hash = JSON.parse response.body
      expect(user_hash).to be_empty
    end
  end

end
