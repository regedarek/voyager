require 'spec_helper'

describe PasswordResetsController do
  describe "#create" do
    before(:each) { @user = FactoryGirl.build(:user)} 
  
    context "user exist" do
      before(:each) { User.stub(:find_by_email).and_return(@user) }      
      
      it "assign @user" do
        post :create, :email => "user@example.com"
        assigns[:user].should eq(@user) 
      end
      
      it "deliver reset password instructions" do
        @user.should_receive(:deliver_reset_password_instructions!)
        post :create, :email => "user@example.com" 
        assigns[:user].should eq(@user)
      end
      
      it "have flash notice"

      it "redirect to root_path" do
        post :create
        response.should redirect_to root_path        
      end
    end
    
    context "user not exist"    # => do something if user not exist

  end
  
  describe "#edit" do
    before(:each) do 
      @user = FactoryGirl.build(:user)
      @user.deliver_reset_password_instructions!
    end

    it "receive load from password token from token in params" do
      @user.deliver_reset_password_instructions!
      User.should_receive(:load_from_reset_password_token).with(@user.reset_password_token)
      get :edit, :id => @user.reset_password_token
    end    
    
    it "assign @user" do
      get :edit, :id => @user.reset_password_token
      assigns[:user].should eq(@user)
    end
    
    it "assign @token" do
      get :edit, :id => @user.reset_password_token
      assigns[:token].should eq(@user.reset_password_token)
    end

    
    context "user exist" do      
      it "returns http success" do
        get :edit, :id => @user.reset_password_token
        response.should be_success
      end
    end
    
    context "user not exist" do
      it "not be sucsess" do
        @user = nil
        assigns(:user).should eq(nil)
        get :edit, :id => "4324"
        response.should_not be_success
        response.should redirect_to login_path
        #should_receive(:not_authenticated)
      end
    end
  end
  
  describe "#update" do
    before(:each) do 
      @user = FactoryGirl.build(:user)
      @user.deliver_reset_password_instructions!
    end
    
    it "assign @token by token params" do
      put :update, :token => @user.reset_password_token # 4, :token => 3142342 # @user.reset_password_token
      assigns[:token].should eq(@user.reset_password_token)
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
    
    context "user can change password" do
      it "be successful" do
        pending
        put :update, :id => 4, :token => 31423242
        response.should redirect_to root_path
      end      
    end
    
    context "user can't change password"

  end

end
