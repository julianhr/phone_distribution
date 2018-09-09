require 'rails_helper'

RSpec.describe "phone_numbers/edit", type: :view do
  let(:area_code) { create(:area_code) }

  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => 1231234,
      :area_code => area_code,
    ))
  end

  it "renders the edit phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do
      assert_select "input[name=?]", "phone_number[number]"
      assert_select "input[name=?]", "phone_number[area_code_id]"
    end
  end
end
