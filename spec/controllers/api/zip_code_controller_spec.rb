require 'rails_helper'

RSpec.describe Api::ZipCodeController, type: :controller do

  describe "GET #random_numbers" do
    it "returns http success" do
      phone_numbers = create_list(:phone_number, 5)
      zip_code = create(:zip_code)
      phone_numbers.each { |pn| ZipCodeAreaCode.create! zip_code: zip_code, area_code: pn.area_code }

      get :random_numbers, params: { code: zip_code.code }

      json_hash = JSON.parse response.body
      expect(response).to have_http_status(:success)
      expect(json_hash.length).to eq phone_numbers.length
    end
  end

end
