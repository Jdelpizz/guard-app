require 'uri'
require 'cgi'
<<<<<<< HEAD
When /^params is empty$/ do
     params = ""
end
=======
>>>>>>> logout

When /^(?:|I )create the user "([^"]*)" "([^"]*)"$/ do |user, pass|
     #goto /users/new
     visit path_to("the users_new page")
     #fill in username
     fill_in("user_username", :with => user)
     #fill in password
     fill_in("user_password", :with => pass)
     #press login
     click_button("Create User")
end

When /^(?:|I )logout$/ do
     visit path_to("the home page")
     click_button("Logout")
end

When /^(?:|I )create the following users:$/ do |fields|
     fields.rows_hash.each do |user, pass|
       When %{I create the user "#{user}" "#{pass}"}
     end
   end

When /^(?:|I )login with "([^"]*)" and "([^"]*)"$/ do |user, pass|
     #goto /login
     visit path_to("the login page")
     #fill in username
     fill_in("username", :with => user)
     #fill in password
     fill_in("password", :with => pass)
     #press login
     click_button("Login")
end