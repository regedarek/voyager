require "spec_helper"


describe "Homepage" do
  it "show homepage" do
    visit(root_path)
    current_path == root_path
  end
end