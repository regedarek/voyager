When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  page.has_selector?('form')
  fill_in field, :with => value
end

When /^I press "([^"]*)"$/ do |button|
  page.has_selector?('form')
  # page.has_selector?('input')
  click_button(button)
end

Then /^I should be login$/ do
  page.has_content?('Signed up!')
end

