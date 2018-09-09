require 'rails_helper'

RSpec.describe "zip_codes/edit", type: :view do
  let(:city) { create(:city) }

  before(:each) do
    @zip_code = assign(:zip_code, ZipCode.create!(
      :code => 12345,
      :city => city,
    ))
  end

  it "renders the edit zip_code form" do
    render

    assert_select "form[action=?][method=?]", zip_code_path(@zip_code), "post" do
      assert_select "input[name=?]", "zip_code[code]"
      assert_select "input[name=?]", "zip_code[city_id]"
    end
  end
end
