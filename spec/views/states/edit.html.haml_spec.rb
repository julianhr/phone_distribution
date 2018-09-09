require 'rails_helper'

RSpec.describe "states/edit", type: :view do
  before(:each) do
    @state = assign(:state, State.create!(
      :code => 'CA',
      :name => 'California'
    ))
  end

  it "renders the edit state form" do
    render

    assert_select "form[action=?][method=?]", state_path(@state), "post" do
      assert_select "input[name=?]", "state[code]"
      assert_select "input[name=?]", "state[name]"
    end
  end
end
