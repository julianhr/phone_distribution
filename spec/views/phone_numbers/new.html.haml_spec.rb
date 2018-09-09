require 'rails_helper'

RSpec.describe "phone_numbers/new", type: :view do
  let(:area_code) { create(:area_code) }

  before(:each) do
    assign(:phone_number, PhoneNumber.new(
      :number => 1231234,
      :area_code => area_code,
    ))
  end

  it "renders new phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do
      assert_select "input[name=?]", "phone_number[number]"
      assert_select "input[name=?]", "phone_number[area_code_id]"
    end
  end
end
