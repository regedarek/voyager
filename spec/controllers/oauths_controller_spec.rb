require 'spec_helper'

describe OauthsController do

  describe "GET 'oauth'" 

  describe "GET 'callback'" do
    it "returns http success" do
      get 'callback'
      response.should redirect_to root_path
    end
  end

end
