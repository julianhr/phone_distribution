require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  let(:area_code) { create(:area_code) }

  before(:each) do
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :number => 1231234,
        :area_code => area_code,
      ),
      PhoneNumber.create!(
        :number => 9879876,
        :area_code => area_code,
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", :text => 1231234.to_s, :count => 1
    assert_select "tr>td", :text => 9879876.to_s, :count => 1
  end
end
