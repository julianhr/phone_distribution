require 'rails_helper'

RSpec.describe "ZipCodes", type: :request do
  describe "GET /zip_codes" do
    it "fetches index" do
      get zip_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
