require 'rails_helper'

RSpec.describe "zip_codes/show", type: :view do
  let(:city) { create(:city) }

  before(:each) do
    @zip_code = assign(:zip_code, ZipCode.create!(
      :code => 12345,
      :city => city
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
