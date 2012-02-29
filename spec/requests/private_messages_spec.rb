require "spec_helper"

describe "Private Messages" do
  before do
    i_have_user
  end

  it "should be visible inbox when logged in" do
    visit_sign_in_page
    fill_in_fields("Email" => "user@example.com", "Password" => "secret")
    click_on ("Log in")

    page.has_link?("Inbox")
  end

  it "should not be visible inbox when not logged in" do
    visit root_path
    page.has_link?("Inbox").should == false
  end
end
