require 'rails_helper'

RSpec.describe Api::PhoneNumberController, type: :controller do

  describe "GET #assign_specific" do
    it "returns http success" do
      get :assign_specific
      expect(response).to have_http_status(:success)
    end
  end

end
