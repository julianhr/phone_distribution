require 'rails_helper'

RSpec.describe Api::ZipCodeController, type: :controller do

  xdescribe "GET #area_codes" do
    it "returns http success" do
      get :area_codes
      expect(response).to have_http_status(:success)
    end
  end

end
