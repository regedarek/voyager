require "spec_helper"
require 'capybara/rspec'


def login
  @user = FactoryGirl.create(:user)
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
