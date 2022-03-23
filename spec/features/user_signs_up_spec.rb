require 'rails_helper'

RSpec.feature "UserSignsUps", type: :feature do
  scenario "User signs up" do
    visit new_user_url
    expect(page).to have_text("New User")

    fill_in "Cellphone", :with=>"555-1212"
    fill_in "First name", :with=>"Rodney"
    fill_in "Last name", :with=>"Doe"
    fill_in "Email", :with=>"webmaster@google.com"
    fill_in "Username", :with=>"The_Doctor"
    fill_in "Password", :with=>"software_engineering"
    click_button "Create"
    expect(page).to have_text("User was successfully created.")
  end
end

RSpec.feature "UserAuthentication", type: :feature do
  before :each do        
    @user = create(:user, username: 'user', password: 'password')
  end

  scenario "User logs in and logs out" do
    visit login_url
    fill_in "Username", :with=>"user"
    fill_in "Password", :with=>"password"
    click_button "Login"
    expect(page).to have_text("logged in")
    click_link "Logout"
    expect(page).to have_text("User was successfully logged out")
  end

  scenario "Users attempts to login with wrong password" do
    visit login_url
    fill_in "Username", :with=>"user"
    fill_in "Password", :with=>"bad"
    click_button "Login"
    expect(page).to have_text("Incorrect password")
  end

end


