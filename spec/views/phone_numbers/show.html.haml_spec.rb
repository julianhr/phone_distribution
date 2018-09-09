require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  let(:area_code) { create(:area_code) }

  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => 1231234,
      :area_code => area_code,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match('1231234')
  end
end
