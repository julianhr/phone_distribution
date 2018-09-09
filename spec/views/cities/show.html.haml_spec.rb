require 'rails_helper'

RSpec.describe "cities/show", type: :view do
  let(:state) { create(:state) }

  before(:each) do
    @city = assign(:city, City.create!(
      :name => "Name",
      :state => state
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
