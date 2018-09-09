require 'rails_helper'

RSpec.describe "cities/index", type: :view do
  let(:state) { create(:state) }

  before(:each) do
    assign(:cities, [
      City.create!(
        :name => "San Diego",
        :state => state
      ),
      City.create!(
        :name => "Los Angeles",
        :state => state
      )
    ])
  end

  it "renders a list of cities" do
    render
    assert_select "tr>td", :text => "San Diego".to_s, :count => 1
    assert_select "tr>td", :text => "Los Angeles", :count => 1
  end
end
