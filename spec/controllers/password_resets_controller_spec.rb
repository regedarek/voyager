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
      pending
      get :edit, :id => 1
      response.should be_success
    end
    
    it "receive load from password token from token in params" do
      User.should_receive(:load_from_reset_password_token).with("3142342")
      get :edit, :id => 3142342
    end
    
    it "assign @user" do
      get :edit, :id => 3142342
      assigns[:user].should eq(@user)
    end
    
    it "assign @token" do
      get :edit, :id => 3142342
      assigns[:token].should eq("3142342")
    end

    context "if not user" do
      it "not authenticated" do
        pending
        @user = nil
        assigns[:user].should eq(@user)
        should_receive(:not_authenticated)
        get :edit, :id => 3142342
        response.should_not be_success
      end
    end
  end
  
  describe "PUT 'update'" do
    it "be successful" do
      pending
      put :update, :id => 4, :token => 31423242
      response.should redirect_to root_path
    end
    
    it "assign @token by token params" do
      pending
      put :update, :id => 4, :token => 3142342
      assigns[:token].should eq("3142342")
    end
    
    it "receive load from reset password token with token" do
      pending
      User.should_receive(:load_from_reset_password_token).with("3142342")
      put :update, :id => 4, :token => 3142342
    end
    
    it "assign @user" do
      pending
      put :update, :id => 3142342
      assigns[:user].should eq(@user)
    end
  end

end
