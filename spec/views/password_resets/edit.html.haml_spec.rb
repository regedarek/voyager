require 'spec_helper'

describe "password_resets/edit.html.haml" do
  it "have a form" do
    assign(:user, mock_model("User").as_null_object)
    render
    rendered.should have_selector("form")
  end
end
