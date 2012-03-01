# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "testuser" 
	  email "user@example.com"
		password "secret"
		password_confirmation "secret"
  end
end
