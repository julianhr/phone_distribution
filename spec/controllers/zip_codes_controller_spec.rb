require 'rails_helper'
RSpec.describe ZipCodesController, type: :controller do
  let(:city) { create(:city) }

  let(:valid_attributes) do
    {
      code: 12345,
      city_id: city.id
    }
  end

  let(:invalid_attributes) do
    {
      code: 123,
      city_id: city.id
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      ZipCode.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      zip_code = ZipCode.create! valid_attributes
      get :show, params: {id: zip_code.to_param}, session: valid_session
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
      zip_code = ZipCode.create! valid_attributes
      get :edit, params: {id: zip_code.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ZipCode" do
        expect {
          post :create, params: {zip_code: valid_attributes}, session: valid_session
        }.to change(ZipCode, :count).by(1)
      end

      it "redirects to the created zip_code" do
        post :create, params: {zip_code: valid_attributes}, session: valid_session
        expect(response).to redirect_to(ZipCode.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {zip_code: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          code: 98765,
        }
      end

      it "updates the requested zip_code" do
        zip_code = ZipCode.create! valid_attributes
        put :update, params: {id: zip_code.to_param, zip_code: new_attributes}, session: valid_session
        zip_code.reload
        expect(zip_code.code).to eq new_attributes[:code]
      end

      it "redirects to the zip_code" do
        zip_code = ZipCode.create! valid_attributes
        put :update, params: {id: zip_code.to_param, zip_code: valid_attributes}, session: valid_session
        expect(response).to redirect_to(zip_code)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        zip_code = ZipCode.create! valid_attributes
        put :update, params: {id: zip_code.to_param, zip_code: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested zip_code" do
      zip_code = ZipCode.create! valid_attributes
      expect {
        delete :destroy, params: {id: zip_code.to_param}, session: valid_session
      }.to change(ZipCode, :count).by(-1)
    end

    it "redirects to the zip_codes list" do
      zip_code = ZipCode.create! valid_attributes
      delete :destroy, params: {id: zip_code.to_param}, session: valid_session
      expect(response).to redirect_to(zip_codes_url)
    end
  end

end
