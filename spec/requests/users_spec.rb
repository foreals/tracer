 require 'rails_helper'
 require 'sessions_controller'
 

RSpec.describe "/users", type: :request do

  before :each do        
    @user = create(:user, password: 'password')
    post login_path, params: {username: @user.username, password: 'password' }
    expect(response).to be_redirect
    expect(session[:user_id]).to be_present 
  end

  describe "GET /index" do
    it "renders a successful response" do
      get users_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get user_url(@user)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_user_url(@user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end

      # it "redirects to the created user" do
      #   user = build(:user)
      #   post users_url, params: { user:  attributes_for(:user) }
      #   user = User.find_by(username: user.username)
      #   expect(response).to redirect_to(user_url(user))
      # end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url, params: { user: attributes_for(:user, cellphone: nil) }
        }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post users_url, params: { user: attributes_for(:user, cellphone: nil) }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { :first_name=> "Newguy"}
      }

     it "updates the requested user" do
       patch user_url(@user), params: { user: new_attributes }
       @user.reload
       expect(@user.first_name).to eq("Newguy")
     end

      it "redirects to the user" do
        patch user_url(@user), params: { user: new_attributes }
        @user.reload
        expect(response).to redirect_to(user_url(@user))
      end
    end

   context "with invalid parameters" do
     let(:invalid_attributes) {
        { :cellphone => nil }
      } 

     it "renders a successful response (i.e. to display the 'edit' template)" do
       patch user_url(@user), params: { user: invalid_attributes }
       expect(response).to be_successful
     end
   end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      expect {
        delete user_url(@user)
      }.to change(User, :count).by(-1)
    end

    # it "redirects to the users list" do
    #   delete user_url(@user)
    #   expect(response).to redirect_to('/welcome')
    # end
  end
end
