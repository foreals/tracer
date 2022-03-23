require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Session" do
        post '/sessions/create', params: { session: create(:user).attributes }
        expect(response).to redirect_to('/login')
      end
    end

    # context "with invalid parameters" do
    #   it "does not create a new Session" do
    #     expect {
    #       post users_url, params: { user: build(:user, cellphone: nil).attributes }
    #     }.to change(User, :count).by(0)
    #   end

    #   it "renders a successful response (i.e. to display the 'new' template)" do
    #     post users_url, params: { user: build(:user, cellphone: nil).attributes }
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "GET /welcome" do
    it "returns http success" do
      get "/welcome"
      expect(response).to have_http_status(:success)
    end
  end

end
