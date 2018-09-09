require 'rails_helper'

RSpec.describe "states/index", type: :view do
  before(:each) do
    assign(:states, [
      State.create!(
        :code => 'CA',
        :name => 'California'
      ),
      State.create!(
        :code => 'OR',
        :name => 'Oregon'
      )
    ])
  end

  it "renders a list of states" do
    render
    assert_select "tr>td", :text => 'CA'.to_s, :count => 1
    assert_select "tr>td", :text => 'OR'.to_s, :count => 1
  end
end
