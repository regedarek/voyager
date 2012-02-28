require "spec_helper"

describe "users/edit.html.haml" do
  it "have form for @user" do
    pending
    render
    rendered.should have_selector("form", :method => "put", "action" => user_path)
  end
end
