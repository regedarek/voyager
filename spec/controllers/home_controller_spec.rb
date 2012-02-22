require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "renders http template" do
      get 'index'
      response.should render_template("index")
    end
  end

end
