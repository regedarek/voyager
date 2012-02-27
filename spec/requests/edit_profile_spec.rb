require "spec_helper"

describe "Edit profile" do
  context "required data" do
    before(:each) do
      sign_in({"Email" => "test@example.com", "Password" => "secret"},root_path, "Logged in!")
      @user = User.find_by_email("test@example.com")
    end

    it "change email" do
      click_link "Profile"
      current_path.should == edit_user_path(@user)
      page.has_selector?('form')
      fill_in "Email", :with => "changed@example.com"
      click_button "Save"
      current_path.should == edit_user_path(@user)
      @user.email.should == "changed@example.com"
    end

    it "change password"

    it "reset"
  end
end
