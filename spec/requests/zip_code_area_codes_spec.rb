require 'rails_helper'

RSpec.describe "ZipCodeAreaCodes", type: :request do
  describe "GET /zip_code_area_codes" do
    it "fetch index" do
      get zip_code_area_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
