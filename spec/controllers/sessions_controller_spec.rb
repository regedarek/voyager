require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "creates a new session" do
      post :create
    end

    it "redirect to root" do
      post :create
      response.should redirect_to root_path
    end
  end
end
