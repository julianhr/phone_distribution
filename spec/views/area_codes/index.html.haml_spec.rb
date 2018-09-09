require 'rails_helper'

RSpec.describe "area_codes/index", type: :view do
  let(:zip_code) { create(:zip_code) }

  before(:each) do
    assign(:area_codes, [
      AreaCode.create!(
        :code => 123,
        :zip_code => zip_code
      ),
      AreaCode.create!(
        :code => 987,
        :zip_code => zip_code
      )
    ])
  end

  it "renders a list of area_codes" do
    render
    assert_select "tr>td", :text => 123.to_s, :count => 1
    assert_select "tr>td", :text => 987.to_s, :count => 1
  end
end
