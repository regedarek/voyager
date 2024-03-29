require "spec_helper"

describe "routes to Sessions" do
  it "routes login_path to sessions#new" do
    get(login_path).should route_to("sessions#new")
  end

  it "routes sessions_path to sessions#create" do
    post(sessions_path).should route_to("sessions#create")
  end

  it "routes logout_path to sessions#destroy" do
    get(logout_path).should route_to("sessions#destroy")
  end
end
