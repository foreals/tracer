require 'rails_helper'

RSpec.feature "UserSearchByNumber", type: :feature do
  scenario "User signs up" do
    visit '/users/new'
    expect(page).to have_text("New User")

    fill_in "Cellphone", :with=>"555-1212"
    fill_in "First name", :with=>"Rodney"
    fill_in "Last name", :with=>"Doe"
    fill_in "Email", :with=>"webmaster@google.com"
    fill_in "Username", :with=>"The_Doctor"
    fill_in "Password", :with=>"software_engineering"
    click_button "Create"
    expect(page).to have_text("User was successfully created.")
    fill_in "Search", :with=> "555-1212"
    click_button "Search"
    expect(page).to have_text("Rodney")
  end
end

