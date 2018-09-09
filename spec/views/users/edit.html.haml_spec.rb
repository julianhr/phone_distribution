require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :full_name => "John Smith",
      :email => "123@email.com"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input[name=?]", "user[full_name]"
      assert_select "input[name=?]", "user[email]"
    end
  end
end
