require 'rails_helper'

RSpec.describe CloseContact, type: :model do
  
  it "accepts good close contacts (with valid data)" do
    close_contact = create(:close_contact)
    expect(close_contact).to be_valid
  end

  it "validates presence of name" do
    close_contact = build(:close_contact, name: nil)
    expect(close_contact).to_not be_valid
  end

end
