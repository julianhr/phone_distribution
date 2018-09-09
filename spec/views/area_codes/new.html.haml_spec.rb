require 'rails_helper'

RSpec.describe "area_codes/new", type: :view do
  before(:each) do
    assign(:area_code, AreaCode.new(
      :code => 1,
    ))
  end

  it "renders new area_code form" do
    render

    assert_select "form[action=?][method=?]", area_codes_path, "post" do
      assert_select "input[name=?]", "area_code[code]"
    end
  end
end
