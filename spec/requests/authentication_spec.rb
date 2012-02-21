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

######################################

describe "Authentication" do
  before(:each) do
    @hash = { "Username" => "testuser", "Email" => "test@example.com", 
              "Password" => "secret", "Password confirmation" => "secret" }     
  end
  
  it "sign up successful" do
    message = "Signed up!" 
    sign_up(@hash, root_path, message)
  end
  
  it "Sign up fail" do
    ["Username", "Email", "Password", "Password confirmation"].each do |el|
      @hash[el], x = "", @hash[el]
      message = "#{el} can't be blank"
      sign_up(@hash, users_path, message)
      @hash[el] = x
    end
  end
end