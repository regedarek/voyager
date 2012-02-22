require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should get create" do
      get :create
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do
    it "should sign out successful" do
      @user = User.create!( :email => "test@example.com", 
                            :password => "secret", 
	                          :password_confirmation => "secret", 
                            :username => "testuser") 
      login_user @user
      get :destroy
      response.should redirect_to root_path
      flash[:notice].should eq("Logged out!")
    end
  end
end
