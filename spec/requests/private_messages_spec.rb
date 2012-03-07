require "spec_helper"

describe "Private Messages" do
  before(:each) do
    @alice = FactoryGirl.create(:user, :username => "alice", :email => "alice@email.com")
    @bob = FactoryGirl.create(:user, :username => "bob", :email => "bob@email.com")
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

  it "should list last messages in inbox" do
    @bob.send_message(@alice, :topic => "Helou alice!", :body => "What's up?")
    visit_sign_in_page
    fill_in_fields("Email" => "alice@email.com", "Password" => "secret")
    click_button ("Log in")
    click_link("Inbox")

    page.should have_content("Helou alice!")
    page.should have_content("bob")
    page.should have_content("less than a minute")
    page.should have_content("What's up?")

    #TODO avatar + remove + mark_as_read
  end

  it "should send new message" do
    visit_sign_in_page
    fill_in_fields("Email" => "alice@email.com", "Password" => "secret")
    click_button ("Log in")
    page.should have_content("Logged")
    visit new_message_path
    fill_in "To", :with => "bob@email.com"
    fill_in "Topic", :with => "Helou bob!"
    fill_in "Body", :with => "Whats'up?"
    click_button "Send Message"
    current_path.should == root_path
  end

  it "should redirect to new if email dont exist" do
    visit_sign_in_page
    fill_in_fields("Email" => "alice@email.com", "Password" => "secret")
    click_button ("Log in")
    page.should have_content("Logged")
    visit new_message_path
    fill_in "To", :with => "wrong_bob@email.com"
    fill_in "Topic", :with => "Helou bob!"
    fill_in "Body", :with => "Whats'up?"
    click_button "Send Message"
    page.should have_content("Wrong email")
    current_path.should ==  new_message_path
  end

  it "should be visible sent messages" do
    @bob.send_message(@alice, :topic => "Helou alice!", :body => "What's up?")
    visit_sign_in_page
    fill_in_fields("Email" => "bob@email.com", "Password" => "secret")
    click_button ("Log in")
    page.should have_content("Logged")
    visit messages_path
    click_link ("Outbox")
    current_path.should == outbox_messages_path
    page.should have_content("Helou alice!")
  end

  it "should be availible to mark as read" do
    @bob.send_message(@alice, :topic => "Helou alice!", :body => "What's up?")
    visit_sign_in_page
    fill_in_fields("Email" => "alice@email.com", "Password" => "secret")
    click_button ("Log in")
    page.should have_content("Logged")
    visit messages_path
    page.should have_content("Helou alice!")

    #TODO
    # click_link ("Mark as read")
  end

  it "should be availible to delete messages" do
    @bob.send_message(@alice, :topic => "Helou alice!", :body => "What's up?")
    visit_sign_in_page
    fill_in_fields("Email" => "alice@email.com", "Password" => "secret")
    click_button ("Log in")
    page.should have_content("Logged")
    visit messages_path
    page.should have_content("Helou alice!")

    click_link ("Delete")
    current_path.should == messages_path
    page.should_not have_content("Helou alice!")
  end
end
