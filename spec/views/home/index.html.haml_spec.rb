require 'spec_helper'

describe "home/index.html.haml" do
  describe "navigation" do
    context "authentication" do
      it "renders links for guest" do
        render
        rendered.should =~ /Sign up/   
      end

      it "renders links for user"
    end
  end
end
