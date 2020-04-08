When("I create the cadet {cwid}") do |cwid|
     #goto /users/new
     visit path_to("the New Cadet page")
     #fill in username
     fill_in("cadet_CWID", :with => cwid)
     #press login
     click_button("Save Cadet")
end

