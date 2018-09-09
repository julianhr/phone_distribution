require 'rails_helper'

RSpec.describe "area_codes/edit", type: :view do
  let(:zip_code) { create(:zip_code) }

  before(:each) do
    @area_code = assign(:area_code, AreaCode.create!(
      :code => 123,
      :zip_code => zip_code
    ))
  end

  it "renders the edit area_code form" do
    render

    assert_select "form[action=?][method=?]", area_code_path(@area_code), "post" do
      assert_select "input[name=?]", "area_code[code]"
      assert_select "input[name=?]", "area_code[zip_code_id]"
    end
  end
end
