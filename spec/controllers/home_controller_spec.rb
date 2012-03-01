require 'spec_helper'

describe HomeController do

  describe "#index" do
    before { get :index }
    it { response.should be_success }
    it { response.should render_template("index") }
  end

end
