require 'rails_helper'

RSpec.describe "cities/edit", type: :view do
  let(:state) { create(:state) }

  before(:each) do
    @city = assign(:city, City.create!(
      :name => "New Great City",
      :state => state
    ))
  end

  it "renders the edit city form" do
    render

    assert_select "form[action=?][method=?]", city_path(@city), "post" do
      assert_select "input[name=?]", "city[name]"
      assert_select "input[name=?]", "city[state_id]"
    end
  end
end
