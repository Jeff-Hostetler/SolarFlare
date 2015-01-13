require 'rails_helper'

describe WeatherController do
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
