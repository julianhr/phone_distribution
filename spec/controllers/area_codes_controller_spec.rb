require 'rails_helper'


RSpec.describe AreaCodesController, type: :controller do
  let(:valid_attributes) do
    {
      code: 123,
    }
  end

  let(:invalid_attributes) do
    {
      code: 12,
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      AreaCode.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      area_code = AreaCode.create! valid_attributes
      get :show, params: {id: area_code.to_param}, session: valid_session
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
      area_code = AreaCode.create! valid_attributes
      get :edit, params: {id: area_code.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new AreaCode" do
        expect {
          post :create, params: {area_code: valid_attributes}, session: valid_session
        }.to change(AreaCode, :count).by(1)
      end

      it "redirects to the created area_code" do
        post :create, params: {area_code: valid_attributes}, session: valid_session
        expect(response).to redirect_to(AreaCode.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {area_code: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          code: 987,
        }
      end

      it "updates the requested area_code" do
        area_code = AreaCode.create! valid_attributes
        put :update, params: {id: area_code.to_param, area_code: new_attributes}, session: valid_session
        area_code.reload
        expect(area_code.code).to eq new_attributes[:code]
      end

      it "redirects to the area_code" do
        area_code = AreaCode.create! valid_attributes
        put :update, params: {id: area_code.to_param, area_code: valid_attributes}, session: valid_session
        expect(response).to redirect_to(area_code)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        area_code = AreaCode.create! valid_attributes
        put :update, params: {id: area_code.to_param, area_code: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested area_code" do
      area_code = AreaCode.create! valid_attributes
      expect {
        delete :destroy, params: {id: area_code.to_param}, session: valid_session
      }.to change(AreaCode, :count).by(-1)
    end

    it "redirects to the area_codes list" do
      area_code = AreaCode.create! valid_attributes
      delete :destroy, params: {id: area_code.to_param}, session: valid_session
      expect(response).to redirect_to(area_codes_url)
    end
  end

end
