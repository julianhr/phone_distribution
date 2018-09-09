require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :full_name => "John Smith",
        :email => "123@email.com"
      ),
      User.create!(
        :full_name => "Eve Clark",
        :email => "987@email.com"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "John Smith".to_s, :count => 1
    assert_select "tr>td", :text => "987@email.com".to_s, :count => 1
  end
end
