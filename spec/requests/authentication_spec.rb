require "spec_helper"

def i_have_user
  user = User.create!(:email => "test@example.com", 
                      :password => "secret", 
	                    :password_confirmation => "secret", 
                      :username => "testuser")
  user.activate!              
end

def fill_in_fields(elements)
  elements.each_pair do |key, val|
    page.has_field?(key)
    fill_in key, :with => val
  end
end

def visit_sign_in_page
  i_have_user
  visit root_path
  click_link "Log in"
  page.has_selector?('form')
end
  
def sign_up(elements, path, message)
  visit(root_path)
  page.has_link?("Sign up")
  click_link("Sign up")  
  page.has_selector?('form')
  fill_in_fields(elements)
  UsersController.stub(:verify_recaptcha).and_return(true)
  page.has_button?("Create new user")
  click_button "Create new user"
  current_path.should == path
  page.has_content?(message).should == true
end

def sign_in(elements, path, message, remember_me = false)
  visit_sign_in_page
  fill_in_fields(elements)
  check('Remember me') if remember_me
  page.has_button?("Log in")
  click_button "Log in"
  current_path.should == path
  page.has_content?(message).should == true
end

def send_forgot_password_email(email)
  visit_sign_in_page

  page.has_content?("Forgot your password?").should == true
  fill_in 'Email', :with => email
  page.has_button?("Reset my password!")
  click_button "Reset my password"
  current_path.should == root_path
  page.has_content?('Instructions have been sent to your email.').should == true
end

def change_password(elements)
  send_forgot_password_email(elements["email"])
  visit edit_password_reset_path(127)
  fill_in_fields(elements)
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
    context "successful" do
      it { sign_in({"Email" => "test@example.com", "Password" => "secret"},root_path, "Logged in!") }
      
      it "and rememeber user" do
        sign_in({"Email" => "test@example.com", "Password" => "secret"},root_path, "Logged in!", true)
      end
    end
    
    it "fail" do
      sign_in({"Email" => "bad@example.com", "Password" => "secret"}, sessions_path, 
		"Email or password was invalid")
      sign_in({"Email" => "test@example.com", "Password" => "bad"}, sessions_path, 
		"Email or password was invalid")
    end
  end
  
  describe "Forgot password" do
    it "send email with link to change password" do
      send_forgot_password_email("test@example.com")   
    end
    
    it "change password" do
      pending
      change_password("Email" => "test@example.com", 
        "Password" => "secret", "Password confirmation" => "secret" ) 
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
