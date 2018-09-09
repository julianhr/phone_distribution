require 'rails_helper'

RSpec.describe "states/new", type: :view do
  before(:each) do
    assign(:state, State.new(
      :code => 'CA',
      :name => 'California'
    ))
  end

  it "renders new state form" do
    render

    assert_select "form[action=?][method=?]", states_path, "post" do
      assert_select "input[name=?]", "state[code]"
      assert_select "input[name=?]", "state[name]"
    end
  end
end
