require 'rails_helper'

RSpec.describe "area_codes/show", type: :view do
  before(:each) do
    @area_code = assign(:area_code, AreaCode.create!(
      :code => 123,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/123/)
    expect(rendered).to match(//)
  end
end
