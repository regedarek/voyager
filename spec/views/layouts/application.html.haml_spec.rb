require "spec_helper"
require 'capybara/rspec'


def login
  @user = User.create!(:email => "test@example.com", :password => "secret", 
	  "password_confirmation" => "secret", :username => "testuser") 
  #visit(login_path)
  #fill_in "Email", :with => "test@example.com"
  #fill_in "Password", :with => "secret"
  #click_button("Sign in")

  login_user @user
end

describe "layouts/application.html.haml" do
  describe "navigation" do
    context "authentication" do
      it "renders links for guest" do
 	      pending "errors, todo in future"
	      render
        rendered.should =~ /Sign up/   
        rendered.should =~ /Log in/
      end

      it "renders links for user" do
        pending "errors with method"
        login
        render
        rendered.should =~ /Log out/
      end
    end
  end
end
