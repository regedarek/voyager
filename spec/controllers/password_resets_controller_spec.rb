require 'spec_helper'

describe PasswordResetsController do

  describe "POST 'create'" do
    before(:each) do
      @user = User.create!( :email => "test@example.com", 
                            :password => "secret", 
	                          :password_confirmation => "secret", 
                            :username => "testuser")
    end
    
    it "successful" do
      post :create
      response.should redirect_to root_path
    end
    
    it "find user by email" do
      User.should_receive(:find_by_email).and_return(@user)
      post :create, :email => "test@example.com"
    end
    
    it "assign @user" do
      User.stub(:find_by_email).and_return(@user)
      post :create, :email => "test@examle.com"
      assigns[:user].should eq(@user)
    end
    
    context "if user exist" do
      it "deliver reset password instructions" do
        User.stub(:find_by_email).and_return(@user)
        @user.should_receive(:deliver_reset_password_instructions!)
        post :create, :email => "test@example.com" 
        assigns[:user].should eq(@user)
      end
    end
  end
  
  describe "GET 'edit'" do
    it "returns http success" do
      get :edit, :id => 1
      response.should be_success
    end
  end

end
