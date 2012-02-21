require 'spec_helper'

describe "home/index.html.haml" do
  describe "navigation" do
    context "authentication" do
      it "renders links for guest" do
	pending
        render
        rendered.should =~ /Sign up/   
        rendered.should =~ /Log in/
      end

      it "renders links for user" do
	pending
        render
        rendered.should =~ /Log out/
      end
    end
  end
end
