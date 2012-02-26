require 'spec_helper'

describe UsersController do
  let(:user) { mock_model(User).as_null_object }
  before { User.stub(:new).and_return(user) }

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
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

  describe "POST 'create'" do
    it "creates a new user" do
      User.should_receive(:new).with("username" => "testuser",
        "email" =>"user@example.com", "password" => "secret", 
        "password_confirmation" => "secret").and_return(user)
      post :create, :user => { "username" => "testuser",
        "email" =>"user@example.com", "password" => "secret", 
        "password_confirmation" => "secret" }
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

  describe "GET 'activate'" do
    context "user exist" do    
      before(:each) do
        @user = User.create!( :email => "test@example.com", 
                              :password => "secret", 
	                            :password_confirmation => "secret", 
                              :username => "testuser") 
      end
    
      it "User receive load_from_activation_token" do
        User.should_receive(:load_from_activation_token).with(@user.id.to_s)
        get :activate, :id => @user.id
      end

      it "receive activate! for user" do
        pending
        User.should_receive(:load_from_activation_token).with(@user.id.to_s)
        assigns[:user].should eq(@user)
        @user.should_receive(:activate!)
        get :activate, :id => @user.id
      end      
      
      it "redirect to login path" do
        pending
        get :activate, :id => @user.id
        response.should redirect_to login_path        
      end
    end
    
    context "user not exist" do
      it "not authenticated" do
        pending
        get :activate, :id => 1
        response should redirect_to root_path
      end
    end
  end
end
