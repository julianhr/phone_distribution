require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  xdescribe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
