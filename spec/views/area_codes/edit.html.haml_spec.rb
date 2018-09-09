require 'rails_helper'

RSpec.describe "area_codes/edit", type: :view do
  before(:each) do
    @area_code = assign(:area_code, AreaCode.create!(
      :code => 123,
    ))
  end

  it "renders the edit area_code form" do
    render

    assert_select "form[action=?][method=?]", area_code_path(@area_code), "post" do
      assert_select "input[name=?]", "area_code[code]"
    end
  end
end
