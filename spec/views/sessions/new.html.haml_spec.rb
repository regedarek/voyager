require 'spec_helper'

describe "sessions/new.html.haml" do
  it "have a form" do
    render
    rendered.should have_selector("form", :method => "post", "action" => login_path)
    rendered.should have_content("Forgot your password?")
    rendered.should have_selector("form", :method => "post", "action" => password_resets_path)
  end
end
