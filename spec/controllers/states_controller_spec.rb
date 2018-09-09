require 'rails_helper'


RSpec.describe StatesController, type: :controller do

  let(:valid_attributes) do
    {
      code: 'CA',
      name: 'California',
    }
  end

  let(:invalid_attributes) do
    {
      code: 'CAAAA',
      name: 'California',
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      State.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      state = State.create! valid_attributes
      get :show, params: {id: state.to_param}, session: valid_session
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
      state = State.create! valid_attributes
      get :edit, params: {id: state.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new State" do
        expect {
          post :create, params: {state: valid_attributes}, session: valid_session
        }.to change(State, :count).by(1)
      end

      it "redirects to the created state" do
        post :create, params: {state: valid_attributes}, session: valid_session
        expect(response).to redirect_to(State.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {state: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          code: 'XY'
        }
      end

      it "updates the requested state" do
        state = State.create! valid_attributes
        put :update, params: {id: state.to_param, state: new_attributes}, session: valid_session
        state.reload
        expect(state.code).to eq new_attributes[:code]
      end

      it "redirects to the state" do
        state = State.create! valid_attributes
        put :update, params: {id: state.to_param, state: valid_attributes}, session: valid_session
        expect(response).to redirect_to(state)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        state = State.create! valid_attributes
        put :update, params: {id: state.to_param, state: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested state" do
      state = State.create! valid_attributes
      expect {
        delete :destroy, params: {id: state.to_param}, session: valid_session
      }.to change(State, :count).by(-1)
    end

    it "redirects to the states list" do
      state = State.create! valid_attributes
      delete :destroy, params: {id: state.to_param}, session: valid_session
      expect(response).to redirect_to(states_url)
    end
  end

end
