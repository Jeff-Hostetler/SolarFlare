require "rails_helper"

describe PagesController do
  describe "#index" do
    it "allows visitor to visit" do
      get :index
      expect(response).to be_success
    end
  end
end
