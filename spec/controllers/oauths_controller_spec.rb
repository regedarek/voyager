require 'spec_helper'

describe OauthsController do

  describe "GET 'oauth'"

  describe "GET 'callback'" do
    it "redirect to root_path" do
      pending
      get :callback, :provider => "twitter"
      response.should redirect_to root_path
    end
  end

end
