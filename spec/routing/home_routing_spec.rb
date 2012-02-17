require "spec_helper"

describe "routes for Home" do
  it "routes '/' to the home controller, index action" do
    get(root_path).should route_to("home#index")
  end
end
