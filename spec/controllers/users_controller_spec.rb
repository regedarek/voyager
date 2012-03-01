require 'spec_helper'

describe UsersController do

  describe "#new" do
    let(:user) { mock_model(User).as_null_object }
    before { User.stub(:new).and_return(user) }
  
    it "returns http success" do
      get :new
      response.should be_success
    end

    it "creates new user object" do
      User.should_receive(:new)
      get :new
    end

    it "assign @user" do
      get :new
      assigns[:user].should eq(user)
    end
  end

  describe "#create" do
    let(:user) { mock_model(User).as_null_object }
    before { User.stub(:new).and_return(user) }
    
    it "creates a new user" do
      hash = { "username" => "testuser", "email" =>"user@example.com", 
        "password" => "secret", "password_confirmation" => "secret" }
      User.should_receive(:new).with(hash).and_return(user)
      post :create, :user => hash
    end

    it "saves the messages" do
      user.should_receive(:save)
      post :create
    end

    context "when the user save successful" do
      before(:each) { user.stub(:save).and_return(true) }

      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("Signed up!")
      end

      it "redirect to root" do
        post :create
        response.should redirect_to root_path
      end
    end

    context "when the user fails to save" do
      before { user.stub(:save).and_return(false) }

      it "assign @user" do
        post :create
        assigns[:user].should eq(user)
      end
      
      it "render new template" do
        post :create
        response.should render_template("new")
      end 
    end
  end

  describe "#activate" do
    before(:each) { @user = FactoryGirl.create(:user) }
    
    it "User receive load_from_activation_token" do
      User.should_receive(:load_from_activation_token).with(@user.activation_token)
      get :activate, :id => @user.activation_token
    end

    it "assign @user" do
      get :activate, :id => @user.activation_token
      assigns[:user].should eq(@user)
    end     
    
    context "user exist" do    
      it "activate" do
        User.any_instance.should_receive(:activate!)
        get :activate, :id => @user.activation_token
      end
      
      it "redirect to login path" do
        get :activate, :id => @user.activation_token
        response.should redirect_to login_path        
      end
    end
    
    context "user not exist" do
      it "not authenticated" do
        get :activate, :id => 1
        response.should redirect_to login_url
      end
    end
  end

  describe "#edit" do
    before(:each) { @user = FactoryGirl.create(:user) }
  
    it "response successful" do
      get :edit, :id => @user.id
      response.should be_success
    end
    
    it "User receive find with id" do
      User.should_receive(:find).with(@user.id.to_s)
      get :edit, :id => @user.id
    end

    it "assign @user" do
      get :edit, :id => @user.id
      assigns[:user].should eq(@user)
    end  
  end

  describe "#update" do
    before(:each) { @user = FactoryGirl.create(:user) }

    it "assign @user" do
      put :update, :id => @user.id, :user => { :password => "secret", :password_confirmation => "secret" }
      assigns[:user].should eq(@user)
    end
    
    it "User update attributes" do
      User.any_instance.should_receive(:update_attributes!)
      put :update, :id => @user.id, :user => { :password => "secret", :password_confirmation => "secret" }
    end
    
    context "update attributes" do
      it "redirect to edit users" do
        put :update, :id => @user.id, :user => { :password => "secret", :password_confirmation => "secret" }
        response.should redirect_to edit_user_path(@user.id)
      end
      
      it "has notice"
    end
    
    context "not update attributes" do
      it "render new action" do
        User.any_instance.stub(:update_attributes!).and_return(false)
        put :update, :id => @user.id, :user => { :password => "secret", :password_confirmation => "secret" }
      end
    end  
  end
end