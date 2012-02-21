require 'spec_helper'

describe "sessions/new.html.haml" do
  it "have a form" do
    render
    rendered.should have_selector("form", :method => "post", "action" => login_path)
  end
end
