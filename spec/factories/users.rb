FactoryGirl.define do
  factory :user do
    username "testuser"
	  email "user@example.com"
		password "secret"
		password_confirmation "secret"
  end
end
