require "spec_helper"

describe "Private Messages" do
  before(:each) do
    @alice = FactoryGirl.create(:user)
    @bob = FactoryGirl.create(:user, :username => "bob", :email => "bob@t.pl")
    @alice.activate!
    @bob.activate!
  end

  it "should be visible inbox when logged in" do
    visit_sign_in_page
    fill_in_fields("Email" => "user@example.com", "Password" => "secret")
    click_button ("Log in")
    page.has_link?("Inbox").should be_true
  end

  it "should not be visible inbox when not logged in" do
    visit root_path
    page.has_link?("Inbox").should be_false
  end

  it "should list sent messages in inbox" do
    @alice.send_message(@bob, :topic => "Helou bob!", :body => "What's up?")
    visit_sign_in_page
    fill_in_fields("Email" => "user@example.com", "Password" => "secret")
    click_button ("Log in")
    click_link("Inbox")

    page.should have_content("Helou bob!")
  end
end
