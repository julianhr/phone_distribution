require 'rails_helper'

RSpec.describe "zip_codes/index", type: :view do
  let(:city) { create(:city) }

  before(:each) do
    assign(:zip_codes, [
      ZipCode.create!(
        :code => 12345,
        :city => city,
      ),
      ZipCode.create!(
        :code => 55555,
        :city => city,
      )
    ])
  end

  it "renders a list of zip_codes" do
    render
    assert_select "tr>td", :text => 12345.to_s, :count => 1
    assert_select "tr>td", :text => 55555.to_s, :count => 1
  end
end
