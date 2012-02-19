require 'spec_helper'

describe "users/new.html.haml" do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "have a form" do
    assign(:user, mock_model("User").as_null_object)
    render
    rendered.should have_selector("form", :method => "post", "action" => users_path)
  end
end
