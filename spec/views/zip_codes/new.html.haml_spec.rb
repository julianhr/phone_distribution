require 'rails_helper'

RSpec.describe "zip_codes/new", type: :view do
  let(:city) { create(:city) }

  before(:each) do
    assign(:zip_code, ZipCode.new(
      :code => 1,
      :city => city
    ))
  end

  it "renders new zip_code form" do
    render

    assert_select "form[action=?][method=?]", zip_codes_path, "post" do
      assert_select "input[name=?]", "zip_code[code]"
      assert_select "input[name=?]", "zip_code[city_id]"
    end
  end
end
