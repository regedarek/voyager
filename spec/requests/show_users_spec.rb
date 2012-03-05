require "spec_helper"

# Only available for logged user.
# Can sort by parameters
describe "Show users" do
  before(:all) do
    @user = FactoryGirl.create(:user, :username => "First", :email => "first@example.com")
    FactoryGirl.create(:user, :username => "Second", :email => "first@example.com")
    FactoryGirl.create(:user, :username => "Third", :email => "first@example.com")
  end
  
  context "all users" do
    it "order by name (default)" do
      sign_in({"Email" => "user@example.com", "Password" => "secret"},root_path, "Logged in!")
      current_path.should == root_path
      click_link "Users"
      current_path.should == users_path
      page.has_content?("First").should == true
      page.has_content?("Second").should == true
      page.has_content?("Third").should == true
    end
  end
  
  context "concret user" do
    it "order by name (default)" do
      sign_in({"Email" => "user@example.com", "Password" => "secret"},root_path, "Logged in!")
      current_path.should == root_path
      click_link "Users"
      current_path.should == users_path
      page.has_content?("First").should == true
      click_link "testuser"
      current_path.should == user_path(@user)
      # page.has_content?("testuser").should == true
      # page.has_content?("user@example.com").should == true
    end    
  end
end