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

Then /^I should be login$/ do
  page.has_content?('Signed up!')
end

