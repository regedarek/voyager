require "spec_helper"

describe "Edit profile" do
  context "required data" do
    before(:each) do
      sign_in({"Email" => "user@example.com", "Password" => "secret"},root_path, "Logged in!")
      @user = User.find_by_email("user@example.com")
    end

    it "change email" do
      click_link "Profile"
      current_path.should == edit_user_path(@user)
      page.has_selector?('form')
      fill_in "Email", :with => "changed@example.com"
      fill_in "Password", :with => "secret"
      fill_in "Password confirmation", :with => "secret"
      click_button "Save"
      current_path.should == edit_user_path(@user)
      page.has_content?("Parameters update").should == true
      # @user.email.should == "changed@example.com"
    end

    it "change password" do
      click_link "Profile"
      current_path.should == edit_user_path(@user)
      page.has_selector?('form')
      fill_in "Email", :with => "changed@example.com"
      fill_in "Password", :with => "other"
      fill_in "Password confirmation", :with => "other"
      click_button "Save"
      current_path.should == edit_user_path(@user)
      page.has_content?("Parameters update.").should == true
    end

    it "reset" do
      pending
      click_link "Profile"
      current_path.should == edit_user_path(@user)
      page.has_selector?('form')
      fill_in "Email", :with => "changed@example.com"
      fill_in "Password", :with => "other"
      fill_in "Password confirmation", :with => "other"
      click_button "Reset"
      current_path.should == edit_user_path(@user)
      page.has_content?("Information was reset.").should == true
    end
  end
end
