require "rails_helper"

describe SessionsController do
  describe "#new" do
    it "allows visitor" do
      get :new

      expect(response).to be_success
    end
    it "redirects a user that is signed in" do
      user = create_user
      session[:user_id] = user.id

      get :new

      expect(response.status).to eq(302)
    end
  end
  describe "#create" do
    it "allows user to sign in with valid data" do
      user = create_user
      post :create, session: {email: user.email, password: user.password}
      expect(session[:user_id]).to eq(user.id)
    end
    it "does not allow user to sign in with invalid data" do
      user = create_user

      post :create, session: {email: user.email, password: "ihacker"}

      expect(session[:user_id]).to eq(nil)
    end
  end
  describe "#destroy" do
    it "allows user to sign out" do
      user = create_user
      session[:user_id] = user.id

      delete :destroy, user: user.id

      expect(session[:user_id]).to eq(nil)
    end
  end
end
