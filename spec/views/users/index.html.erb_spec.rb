require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        cellphone: "Cellphone",
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        username: "Username",
        password_digest: "Password"
        
      ),
      User.create!(
        cellphone: "Cellphone1",
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        username: "Username1",
        password_digest: "Password1"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Cellphone".to_s, count: 1
    assert_select "tr>td", text: "Cellphone1".to_s, count: 1
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
