require "rails_helper"

describe SensorsController do
  describe "#current_reading" do
    it "redirects visitor to login" do
      user = create_user

      get :current_reading, {user_id: user.id}

      expect(response.status).to eq(302)
    end
    it "does allow user to own sensor page" do
      user = create_user
      session[:user_id] = user.id

      get :current_reading, {user_id: user.id}

      expect(response.status).to eq(200)
    end
    it "does not allow user to other users sensor" do
      user = create_user
      user2 = create_user2
      session[:user_id] = user.id

      get :current_reading, {user_id: user2.id}

      expect(response.status).to eq(404)
    end
  end
end
