require 'rails_helper'


RSpec.describe CitiesController, type: :controller do
  let(:state)  { create(:state) }

  let(:valid_attributes) do
    {
      name: 'San Francisco',
      state_id: state.id,
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      state_id: state.id,
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      City.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      city = City.create! valid_attributes
      get :show, params: {id: city.to_param}, session: valid_session
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
      city = City.create! valid_attributes
      get :edit, params: {id: city.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new City" do
        expect {
          post :create, params: {city: valid_attributes}, session: valid_session
        }.to change(City, :count).by(1)
      end

      it "redirects to the created city" do
        post :create, params: {city: valid_attributes}, session: valid_session
        expect(response).to redirect_to(City.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {city: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          name: 'Sacramento',
        }
      end

      it "updates the requested city" do
        city = City.create! valid_attributes
        put :update, params: {id: city.to_param, city: new_attributes}, session: valid_session
        city.reload
        expect(city.name).to eq new_attributes[:name]
      end

      it "redirects to the city" do
        city = City.create! valid_attributes
        put :update, params: {id: city.to_param, city: valid_attributes}, session: valid_session
        expect(response).to redirect_to(city)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        city = City.create! valid_attributes
        put :update, params: {id: city.to_param, city: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested city" do
      city = City.create! valid_attributes
      expect {
        delete :destroy, params: {id: city.to_param}, session: valid_session
      }.to change(City, :count).by(-1)
    end

    it "redirects to the cities list" do
      city = City.create! valid_attributes
      delete :destroy, params: {id: city.to_param}, session: valid_session
      expect(response).to redirect_to(cities_url)
    end
  end

end
