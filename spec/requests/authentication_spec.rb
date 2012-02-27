require "spec_helper"

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
      change_password("test@example.com") 
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
