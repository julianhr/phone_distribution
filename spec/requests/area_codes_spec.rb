require 'rails_helper'

RSpec.describe "AreaCodes", type: :request do
  describe "GET /area_codes" do
    it "fetch index" do
      get area_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
