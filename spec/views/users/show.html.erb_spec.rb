require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      cellphone: "Cellphone",
      first_name: "First Name",
      last_name: "Last Name",
      email: "Email",
      username: "Username",
      password_digest: "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cellphone/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
  end
end
