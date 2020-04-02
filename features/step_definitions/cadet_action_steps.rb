require 'uri'
require 'cgi'

When /^(?:|I )add schedule "([^"]*)"$/ do |schedule|
     click_button("Profile")
     fill_in("schedule_field", :with => schedule)
     click_button("submit")
end

