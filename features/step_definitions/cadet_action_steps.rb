require 'uri'
require 'cgi'

When /^(?:|I )add schedule "([^"]*)"$/ do |schedule|
     click_button("Add Schedule")
     fill_in("schedule_field", :with => schedule)
     click_button("submit")
end

