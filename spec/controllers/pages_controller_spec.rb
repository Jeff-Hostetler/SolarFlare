require "rails_helper"

describe PagesController do
  describe "#index" do
    it "allows visitor to visit" do
      get :index
      expect(response).to be_success
    end
  end
  describe "#about" do
    it "allows visitor to about" do
      get :about
      expect(response).to be_success
    end
  end
  describe "#products" do
    it "allows visitor to products" do
      get :products 
      expect(response).to be_success
    end
  end
end
