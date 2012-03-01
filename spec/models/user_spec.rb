require 'spec_helper'

describe User do
  describe "validation" do
    context "validate presence of attributes" do
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
      it { should validate_presence_of(:password_confirmation) }
    end

    context "validate confirmation of password" do
      before { @user = FactoryGirl.build(:user, :password_confirmation => nil)}

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
