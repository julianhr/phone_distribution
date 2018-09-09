require 'rails_helper'

RSpec.describe "area_codes/new", type: :view do
  let(:zip_code) { create(:zip_code) }

  before(:each) do
    assign(:area_code, AreaCode.new(
      :code => 1,
      :zip_code => zip_code
    ))
  end

  it "renders new area_code form" do
    render

    assert_select "form[action=?][method=?]", area_codes_path, "post" do
      assert_select "input[name=?]", "area_code[code]"
      assert_select "input[name=?]", "area_code[zip_code_id]"
    end
  end
end
