require 'rails_helper'

RSpec.describe User, type: :model do

  it "accept good users (with valid data)" do
    user = create(:user)       # created with factorybot
    expect(user).to be_valid
  end

  it "validates presence of cell phone" do
    user = build(:user, cellphone: nil)
    expect(user).to_not be_valid
  end

  it "validates the presence of first name" do
    user = build(:user, first_name: nil)
    expect(user).to_not be_valid
  end

  it "validates the presence of last name" do
    user = build(:user, last_name: nil)
    expect(user).to_not be_valid
  end

  it "validates the presence of email address" do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it "validates the presence of a Username" do
    user = build(:user, username: nil)
    expect(user).to_not be_valid
  end

  it "validates the presences of a password" do
    user = build(:user, password_digest: nil)
    expect(user).to_not be_valid
  end
  
  it "should not be admin" do
    user = create(:user)
    expect(user.admin).to_not be_truthy
  end

  it "should be admin" do
    admin_user = create(:admin_user)
    expect(admin_user.admin).to be_truthy
  end

end
