require "spec_helper"

def i_have_user
  User.create!( :email => "test@example.com", 
                :password => "secret", 
	              :password_confirmation => "secret", 
                :username => "testuser")  
end

def fill_in_fields(elements)
  elements[:fields].each do |hash|
    hash.each_pair do |key, val|
      page.has_field?(key)
      fill_in key, :with => val
    end
  end
end

def sign_up(elements, path)
  visit(root_path)
  page.has_link?("Sign up")
  click_link("Sign up")  
  page.has_selector?('form')
  
  fill_in_fields(elements)
  
  page.has_button?("Create new user")
  click_button "Create new user"
  current_path.should == path
  page.has_content?(elements[:message]).should == true
end

describe "Authentication" do
  it "sign up successful" do
    arr = { :fields => ["Username" => "testuser", "Email" => "test@example.com", 
              "Password" => "secret", "Password confirmation" => "secret" ], 
            :message => "Signed up!" }

    sign_up(arr, root_path)
  end
  
  it "Sign up fail" do
    visit root_path
    page.has_link?("Sign up")
    click_link("Sign up")
    page.has_selector?('form')
    
    pending
    [ "Username" => "testuser", "Email" => "test@example.com", 
      "Password" => "secret", "Password confirmation" => "secret" ]
    fill_in_fields(arr)
    
    page.has_button?("Create new user")
    click_button "Create new user"
    current_path.should == root_path
    page.has_content?("Signed up!").shiuld == true
  end
end