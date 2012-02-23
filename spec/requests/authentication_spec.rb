require "spec_helper"

def i_have_user
  User.create!( :email => "test@example.com", 
                :password => "secret", 
	              :password_confirmation => "secret", 
                :username => "testuser")  
end

def fill_in_fields(elements)
  elements.each_pair do |key, val|
    page.has_field?(key)
    fill_in key, :with => val
  end
end

def sign_up(elements, path, message)
  visit(root_path)
  page.has_link?("Sign up")
  click_link("Sign up")  
  page.has_selector?('form')
  fill_in_fields(elements)
  page.has_button?("Create new user")
  click_button "Create new user"
  current_path.should == path
  page.has_content?(message).should == true
end

def sign_in(elements, path, message)
  i_have_user
  visit root_path
  click_link "Log in"
  page.has_selector?('form')
  fill_in_fields(elements)
  page.has_button?("Log in")
  click_button "Log in"
  current_path.should == path
  page.has_content?(message).should == true
end
######################################

describe "Authentication" do
  describe "Sign up" do
    before(:each) do
      @hash = { "Username" => "testuser", "Email" => "test@example.com", 
                "Password" => "secret", "Password confirmation" => "secret" }     
    end
  
    it "successful" do
      sign_up(@hash, root_path, "Signed up!")
    end
  
    it "fail" do
      ["Username", "Email", "Password", "Password confirmation"].each do |el|
        @hash[el], x = "", @hash[el]
        message = "#{el} can't be blank"
        sign_up(@hash, users_path, message)
        @hash[el] = x
      end
    end
  end
  
  describe "Sign in" do
    it "successful" do 
      sign_in({"Email" => "test@example.com", "Password" => "secret"}, root_path, "Logged in!")
    end
    
    it "fail" do
      sign_in({"Email" => "bad@example.com", "Password" => "secret"}, sessions_path, 
		"Email or password was invalid")
      sign_in({"Email" => "test@example.com", "Password" => "bad"}, sessions_path, 
		"Email or password was invalid")
    end
  end
  
  describe "Sign out" do
    it "successful" do
      sign_in({"Email" => "test@example.com", "Password" => "secret"}, root_path, "Logged in!")
      current_path.should == root_path
      click_link "Log out"
      current_path.should == root_path
      page.has_content?("Logged out!").should == true
    end
  end
end
