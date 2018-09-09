require 'rails_helper'


RSpec.describe ZipCodeAreaCodesController, type: :controller do
  let(:zip_code) { create(:zip_code) }
  let(:area_code) { create(:area_code) }

  let(:valid_attributes) do
    {
      zip_code_id: zip_code.id,
      area_code_id: area_code.id,
    }
  end

  let(:invalid_attributes) do
    {
      zip_code_id: nil,
      area_code_id: nil,
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      ZipCodeAreaCode.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      zip_code_area_code = ZipCodeAreaCode.create! valid_attributes
      get :show, params: {id: zip_code_area_code.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      zip_code_area_code = ZipCodeAreaCode.create! valid_attributes
      get :edit, params: {id: zip_code_area_code.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ZipCodeAreaCode" do
        expect {
          post :create, params: {zip_code_area_code: valid_attributes}, session: valid_session
        }.to change(ZipCodeAreaCode, :count).by(1)
      end

      it "redirects to the created zip_code_area_code" do
        post :create, params: {zip_code_area_code: valid_attributes}, session: valid_session
        expect(response).to redirect_to(ZipCodeAreaCode.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {zip_code_area_code: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:state) { State.first }
      let(:other_city) { City.create! name: 'New City', state: state }
      let(:other_zip_code) { ZipCode.create! code: 64645, city: other_city }

      let(:new_attributes) do
        {
          zip_code_id: other_zip_code.id
        }
      end

      it "updates the requested zip_code_area_code" do
        zip_code_area_code = ZipCodeAreaCode.create! valid_attributes
        put :update, params: {id: zip_code_area_code.to_param, zip_code_area_code: new_attributes}, session: valid_session
        zip_code_area_code.reload
        expect(zip_code_area_code.zip_code_id).to eq new_attributes[:zip_code_id]
      end

      it "redirects to the zip_code_area_code" do
        zip_code_area_code = ZipCodeAreaCode.create! valid_attributes
        put :update, params: {id: zip_code_area_code.to_param, zip_code_area_code: valid_attributes}, session: valid_session
        expect(response).to redirect_to(zip_code_area_code)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        zip_code_area_code = ZipCodeAreaCode.create! valid_attributes
        put :update, params: {id: zip_code_area_code.to_param, zip_code_area_code: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested zip_code_area_code" do
      zip_code_area_code = ZipCodeAreaCode.create! valid_attributes
      expect {
        delete :destroy, params: {id: zip_code_area_code.to_param}, session: valid_session
      }.to change(ZipCodeAreaCode, :count).by(-1)
    end

    it "redirects to the zip_code_area_codes list" do
      zip_code_area_code = ZipCodeAreaCode.create! valid_attributes
      delete :destroy, params: {id: zip_code_area_code.to_param}, session: valid_session
      expect(response).to redirect_to(zip_code_area_codes_url)
    end
  end

end
