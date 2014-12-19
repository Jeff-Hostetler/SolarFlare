require "rails_helper"

describe UsersController do
  describe "#index" do
    it "allows admin to view the index" do
      user = create_user
      admin = create_admin
      session[:user_id] = admin.id

      get :index

      expect(response).to be_success
    end
    it "does not allow user to access" do
      user = create_user
      session[:user_id] = user.id

      get :index

      expect(response.status).to eq(404)
    end
    it "does not allow visitor to access" do
      get :index

      expect(response.status).to eq(302)
    end
  end

  describe "#new" do
    it "allows visitor to visit signup page" do
      get :new

      expect(response).to be_success
    end
  end

  describe "#create" do
    it "allows a user to sign up" do
    expect(User.count).to eq(0)

    post :create, user: {first_name: "Test",
                        last_name: "User",
                        email: "test@test.com",
                        password: "password",
                        password_confirmation: "password"}
    expect(User.count).to eq(1)
    end
  end
  describe "edit" do
    it "allows admin to edit info" do
      user = create_user
      admin = create_admin
      session[:user_id] = admin.id

      patch :update, id: user.id, user: {first_name: user.first_name,
                                          last_name: user.last_name,
                                          email: user.password,
                                          password: "password",
                                          password_confirmation: "password"}

      expect(response.status).to eq(302)
    end
    it "allows user to edit thier info" do
      user = create_user
      session[:user_id] = user.id

      patch :update, id: user.id, user: {first_name: user.first_name,
                                        last_name: user.last_name,
                                        email: user.password,
                                        password: "password",
                                        password_confirmation: "password"}

        expect(response.status).to eq(302)
    end
    it "does not allow user to edit another" do
      user = create_user
      user2 = create_user2
      session[:user_id] = user2.id

      patch :update, id: user.id, user: {first_name: user.first_name,
                                        last_name: user.last_name,
                                        email: user.password,
                                        password: "password",
                                        password_confirmation: "password"}

        expect(response.status).to eq(404)
    end
  end
end
