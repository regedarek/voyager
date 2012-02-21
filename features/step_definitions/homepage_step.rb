Given /^I am a guest$/ do

end

When /^I go to the homepage$/ do
  visit(root_path)
end

Then /^I should be on the homepage$/ do
  current_path == root_path
end

When /^I follow "([^"]*)"$/ do |link_text|
  page.has_link?(link_text)
  click_link(link_text)
end
