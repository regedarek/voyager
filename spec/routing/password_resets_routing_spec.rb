require "spec_helper"

describe "routes to Password Resets" do
  it "routes password_resets_path to 'password_resets#create'" do
    post(password_resets_path).should route_to('password_resets#create')
  end
  
  it "routes to edit" do
    get('password_resets/1/edit').should route_to("password_resets#edit", "id" => "1")
  end
end