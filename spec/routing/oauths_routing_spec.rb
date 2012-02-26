require "spec_helper"

describe "routes to oauths" do
  it "routes 'oauth/:provider' to oauths#callback" do
    get('oauth/twitter').should route_to("oauths#oauth", :provider => "twitter")
    get(auth_at_provider_path("twitter")).should route_to("oauths#oauth", :provider => "twitter")
  end
end