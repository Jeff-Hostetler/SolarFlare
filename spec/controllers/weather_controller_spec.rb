require 'rails_helper'

describe WeatherController do
  describe "#weekly" do
    it "does not allow visitors" do
      user = create_user

      get :weekly, user_id: user.id

      expect(response.status).to eq(302)
    end
    it "allows user to visit thier page" do
      user = create_user
      session[:user_id] = user.id

      get :weekly, user_id: user.id

      expect(response).to be_success
    end
    it "does not allow user to vist another's" do
      user = create_user
      user2 = create_user2
      session[:user_id] = user.id

      get :weekly, user_id: user2.id

      expect(response.status).to eq (404)
    end
    it "allows admin to user weather pages" do
      user = create_user
      admin = create_admin
      session[:user_id] = admin.id

      get :weekly, user_id: user.id

      expect(response).to be_success
    end
  end
  describe "#daily" do
    it "does not allow visitors" do
      user = create_user

      get :daily, user_id: user.id

      expect(response.status).to eq(302)
    end
    it "allows user to visit thier page" do
      user = create_user
      session[:user_id] = user.id

      get :daily, user_id: user.id

      expect(response).to be_success
    end
    it "does not allow user to vist another's" do
      user = create_user
      user2 = create_user2
      session[:user_id] = user.id

      get :daily, user_id: user2.id

      expect(response.status).to eq (404)
    end
  end

  describe "#cloud_coverage" do
    it "does not allow visitors" do
      user = create_user

      get :cloud_coverage, user_id: user.id

      expect(response.status).to eq(302)
    end
    it "allows user to visit thier page" do
      user = create_user
      session[:user_id] = user.id

      get :cloud_coverage, user_id: user.id

      expect(response).to be_success
    end
    it "does not allow user to vist another's" do
      user = create_user
      user2 = create_user2
      session[:user_id] = user.id

      get :cloud_coverage, user_id: user2.id

      expect(response.status).to eq (404)
    end
  end
end
