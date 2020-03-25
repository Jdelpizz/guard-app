Given(/^I am on the xo's page$/) do
  visit('/cadets')
end

Then(/^I should see the spreadsheet$/) do
  page.has_content?("Company Spreadsheet")
end 