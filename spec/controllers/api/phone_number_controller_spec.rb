require 'rails_helper'

RSpec.describe Api::PhoneNumberController, type: :controller do

  def get_number_for_params(phone_number)
      "#{phone_number.area_code.code}-#{phone_number.number.to_s[0..2]}-#{phone_number.number.to_s[3..-1]}"
  end

  describe "POST #assign_specific" do
    it "assigns a user to a phone number" do
      user = create(:user)
      phone_number = create(:phone_number)
      expect(phone_number.user).to be_nil

      post :assign_specific, params: { email: user.email, number: get_number_for_params(phone_number) }
      phone_number.reload

      expect(response).to have_http_status(:success)
      expect(phone_number.user.id).to eq user.id
    end

    it "returns json annoucing if phone number was succesfully assigned" do
      user = create(:user)
      phone_number = create(:phone_number)

      post :assign_specific, params: { email: user.email, number: get_number_for_params(phone_number) }
      json_hash = JSON.parse response.body
      expect(json_hash['assigned']).to eq true
    end
  end

  describe "GET #availability" do
    it 'return true if a phone number is available' do
      phone_number = create(:phone_number)
      number = get_number_for_params(phone_number)

      get :availability, params: { number: get_number_for_params(phone_number) }

      json_hash = JSON.parse response.body
      expect(json_hash['available']).to eq true
    end

    it 'return false if a phone number is not available' do
      get :availability, params: { number: '222-333-4444' }
      json_hash = JSON.parse response.body
      expect(json_hash['available']).to eq false
    end
  end

end
