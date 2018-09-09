require 'rails_helper'

RSpec.describe "zip_code_area_codes/new", type: :view do
  let(:zip_code) { create(:zip_code) }
  let(:area_code) { create(:area_code) }

  before(:each) do
    assign(:zip_code_area_code, ZipCodeAreaCode.new(
      :zip_code_id => zip_code.id,
      :area_code_id => area_code.id
    ))
  end

  it "renders new zip_code_area_code form" do
    render

    assert_select "form[action=?][method=?]", zip_code_area_codes_path, "post" do
      assert_select "input[name=?]", "zip_code_area_code[zip_code_id]"
      assert_select "input[name=?]", "zip_code_area_code[area_code_id]"
    end
  end
end
