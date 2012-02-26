require "spec_helper"

describe "routes to users" do
  it "routes login_path to users#new" do
    get(signup_path).should route_to("users#new")
  end
  
  it "routes /users/:id/activate to users#activate" do
    get("/users/1/activate").should route_to("users#activate", :id => "1")
  end
end
