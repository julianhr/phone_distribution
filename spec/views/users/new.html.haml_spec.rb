require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :full_name => "John Smith",
      :email => "123@email.com"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input[name=?]", "user[full_name]"
      assert_select "input[name=?]", "user[email]"
    end
  end
end
