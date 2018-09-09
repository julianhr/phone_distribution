require 'rails_helper'

RSpec.describe "zip_code_area_codes/index", type: :view do
  let(:zip_code) { create(:zip_code) }
  let(:area_code1) { create(:area_code) }
  let(:area_code2) { create(:area_code) }

  before(:each) do
    assign(:zip_code_area_codes, [
      ZipCodeAreaCode.create!(
        :zip_code_id => zip_code.id,
        :area_code_id => area_code1.id
      ),
      ZipCodeAreaCode.create!(
        :zip_code_id => zip_code.id,
        :area_code_id => area_code2.id
      )
    ])
  end

  it "renders a list of zip_code_area_codes" do
    render
    assert_select "tr>td", :text => area_code1.code.to_s, :count => 1
    assert_select "tr>td", :text => area_code2.code.to_s, :count => 1
  end
end
