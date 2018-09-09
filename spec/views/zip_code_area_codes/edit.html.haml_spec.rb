require 'rails_helper'

RSpec.describe "zip_code_area_codes/edit", type: :view do
  let(:zip_code) { create(:zip_code) }
  let(:area_code) { create(:area_code) }

  before(:each) do
    @zip_code_area_code = assign(:zip_code_area_code, ZipCodeAreaCode.create!(
      :zip_code_id => zip_code.id,
      :area_code_id => area_code.id,
    ))
  end

  it "renders the edit zip_code_area_code form" do
    render

    assert_select "form[action=?][method=?]", zip_code_area_code_path(@zip_code_area_code), "post" do
      assert_select "input[name=?]", "zip_code_area_code[zip_code_id]"
      assert_select "input[name=?]", "zip_code_area_code[area_code_id]"
    end
  end
end
