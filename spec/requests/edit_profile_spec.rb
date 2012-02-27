require "spec_helper"

describe "Edit profile" do
  context "required data" do
    it "change email" do
      sign_in({"Email" => "test@example.com", "Password" => "secret"},root_path, "Logged in!") 
      click_link "Profile"
      current_path.should user_edit_path
      pending
    end

    it "change password"
  end
end
