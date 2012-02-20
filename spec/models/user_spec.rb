require 'spec_helper'

describe User do
  before(:each) { User.create!(	:username => "testuser", 
				:email => "user@example.com",
				:password => "secret",
				:password_confirmation => "secret") }

  context "validate presence of attribute" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
  end
end
