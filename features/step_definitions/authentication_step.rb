When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  page.has_selector?('form')
  page.has_field?(field)
  fill_in field, :with => value
end

When /^I press "([^"]*)"$/ do |button|
  page.has_selector?('form')
  page.has_button?(button)
  click_button(button)
end

Then /^I should be register$/ do
  page.has_content?('Signed up!')
end

Then /^I should be logged in$/ do
  page.has_content?('Logged in')
end


Then /^I should be on the the sign up page$/ do
  current_path.should == users_path
end

Then /^I should see "([^"]*)"$/ do |message|
  page.has_content?(message).should == true 
end

