require 'uri'
require 'cgi'
When /^params is empty$/ do
     params = ""
end

When /^(?:|I )create the user "([^"]*)" "([^"]*)" "([^"]*)"$/ do |user, pass, cwid|
     #goto /users/new
     visit path_to("the users_new page")
     #fill in username
     fill_in("user_username", :with => user)
     #fill in password
     fill_in("user_password", :with => pass)
     #fill in CWID
     fill_in("user_CWID", :with => cwid)
     #press login
     click_button("Create User")
end

When /^(?:|I )create the following users:$/ do |fields|
     fields.rows_hash.each do |user, pass, cwid|
       When %{I create the user "#{user}" "#{pass}" "#{cwid}"}
     end
end

When /^(?:|I )create the cadet "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/ do |fname, mname, lname, cstatus, co, rnum, pnum, email, rank|
     visit path_to("the new_cadet page")
     fill_in("cadet_F_NAME", :with => fname )
     fill_in("cadet_M_INITIAL", :with => mname )
     fill_in("cadet_L_NAME", :with => lname )
     select(cstatus, :from => 'cadet_C_STATUS' )
     select(co, :from => 'cadet_CO_ID' )
     fill_in("cadet_R_NUM", :with => rnum )
     fill_in("cadet_P_NUM", :with => pnum )
     fill_in("cadet_EMAIL", :with => email )
     select(rank, :from => 'cadet_RANK_ID' )
     click_button("commit")

end

When /^(?:|I )create the following cadets:$/ do |fields|
     fields.rows_hash.each do |user, pass, fname, mname, lname, cstatus, co, rnum, pnum, email, rank|
      When %{I login with "#{user}" and "#{pass}"}
      When %{I create the cadet "#{fname}" "#{mname}" "#{lname}" "#{cstatus}" "#{co}" "#{rnum}" "#{pnum}" "#{email}" "#{rank}"}
     end
end


When /^(?:|I )logout$/ do
     visit path_to("the home page")
     click_button("Logout")
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

