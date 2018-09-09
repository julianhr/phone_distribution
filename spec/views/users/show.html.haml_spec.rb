require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :full_name => "John Smith",
      :email => "123@email.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match('John Smith')
    expect(rendered).to match('123@email.com')
  end
end
