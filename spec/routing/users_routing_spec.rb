require "spec_helper"

describe "routes to users" do
  it "routes login_path to users#new" do
    get(login_path).should route_to("users#new")
  end
end
