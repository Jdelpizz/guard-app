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

When /^(?:|I )create the cadet:$/ do |values|
     fields.rows_hash.each do |fname, mname, lname, cstatus, co, rnum, pnum, email, rank|
     When %{I fill in the following:}
          %{| cadet_F_NAME      | #{fname}   |}
          %{| cadet_M_INITIAL   | #{mname}   |}
          %{| cadet_L_NAME      | #{lname}   |}
          %{| cadet_C_STATUS    | #{cstatus} |}
          %{| cadet_CO_ID       | #{co}      |}
          %{| cadet_R_NUM       | #{rnum}    |}
          %{| cadet_P_NUM       | #{pnum}    |}
          %{| cadet_EMAIL       | #{email}   |}
          %{| cadet_RANK_ID     | #{rank}    |}
     end
end

When /^(?:|I )create the following cadets:$/ do |fields|
     fields.rows_hash.each do |user, pass|
       When %{I create the user "#{user}" "#{pass}"}
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

