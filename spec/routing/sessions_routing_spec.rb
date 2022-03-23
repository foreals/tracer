require 'rails_helper'

RSpec.describe "Sessions", type: :routing do

  describe "GET /" do
    it "routes to sessions#welcome" do
    expect(get: "/").to route_to("sessions#welcome")
    end
  end
end
