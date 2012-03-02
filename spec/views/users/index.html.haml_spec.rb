require "spec_helper"

describe "users/index.html" do
  it "show all users" do
    user1 = mock_model("User").as_null_object
    user2 = mock_model("User").as_null_object
    users = [user1, user2]
    users[0].stub(:username).and_return("First")
    users[1].stub(:username).and_return("Second")
    assign(:users, users)
    render
    rendered.should have_content("First")
    rendered.should have_content("Second")
  end
end