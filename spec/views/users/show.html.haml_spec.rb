require "spec_helper"

describe "users/show.html.haml" do
  it "should render" do
    user = mock_model("User")
    user.stub(:username).and_return("testuser")
    user.stub(:email).and_return("user@example.com")
    assign(:user, user)
    render
    rendered.should have_content("testuser")
    rendered.should have_content("user@example.com")
  end
end