require 'spec_helper'

describe User do
  before(:each) { User.create!( :username => "testuser", 
					 :email => "user@example.com",
					 :password => "secret",
					 :password_confirmation => "secret") }

  describe "validation" do
    context "validate presence of attributes" do
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
      it { should validate_presence_of(:password_confirmation) }
    end

    context "validate confirmation of password" do
      before { @user = User.new(:username => "testuser", 
				:password => "secret", 
				:password_confirmation => nil, 
				:email => "user@example.com") }

      it "have confirmation" do
        @user.password_confirmation = "secret"
        @user.should be_valid
      end

      it "haven't confirmation" do
        @user.should_not be_valid
      end
    end
  end
  
  describe "associations" do
    it { should have_many(:authentications).dependent(:destroy) }
  end
end
