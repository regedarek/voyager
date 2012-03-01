def i_have_user
  @user = FactoryGirl.create(:user)
  @user.activate!              
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
  i_have_user
  visit_sign_in_page

  page.has_content?("Forgot your password?").should == true
  fill_in 'Email', :with => email 
  page.has_button?("Reset my password!")
  click_button "Reset my password"
  current_path.should == root_path
  # page.has_content?('Instructions have been sent to your email.').should == true
  # page.has_content?('User not found.').should == true
end

def change_password(email)
  send_forgot_password_email(email)
  visit edit_password_reset_path(127)
  fill_in "Email", :with => email
end
