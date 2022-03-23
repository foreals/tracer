require 'rails_helper'

RSpec.describe Testform, type: :model do
  
  it "accepts good testforms (with valid data)" do
    testform = create(:testform)
    expect(testform).to be_valid
  end

  it "validates presence of date" do
    testform = build(:testform, date: nil)
    expect(testform).to_not be_valid
  end

  it "validates presence of result" do
    testform = build(:testform, RESULT: nil)
    expect(testform).to_not be_valid
  end
end
