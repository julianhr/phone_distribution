require 'rails_helper'

RSpec.describe "zip_code_area_codes/show", type: :view do
  let(:zip_code) { create(:zip_code) }
  let(:area_code) { create(:area_code) }

  before(:each) do
    @zip_code_area_code = assign(:zip_code_area_code, ZipCodeAreaCode.create!(
      :zip_code_id => zip_code.id,
      :area_code_id => area_code.id,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match("#{zip_code.code}")
    expect(rendered).to match("#{area_code.code}")
  end
end
