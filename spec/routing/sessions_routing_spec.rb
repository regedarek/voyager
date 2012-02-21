require "spec_helper"

describe "routes to Sessions" do
  it "routes login_path to sessions#new" do
    get(login_path).should route_to("sessions#new")
  end
end
