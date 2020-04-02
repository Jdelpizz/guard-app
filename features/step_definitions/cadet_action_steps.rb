require 'uri'
require 'cgi'
schedule = "Class Schedule \nCourse 	Class Type 	Title 	Days 	Time 	Location 	Instructor \nAERO 402 	LEC 	Natl Secur Aff/Prep for AD II 	MWF 	0800-0850 	Jenkins Hall 305 	Yerage, Edward .\nELEC 330 	LEC 	Digital Systems Engr 	TR 	0930-1045 	Grimsley Hall 305 	Hayne, Ronald J.\nAERO 450 	LAB 	USAF Contract Training Lab 	R 	1600-1800 	Jenkins Hall 101 	Thurber, Kathleen .\nCSCI 421 	LEC 	Software Engineering Practicum 	TR 	1100-1215 	Thompson Hall 319 	Verdicchio, Michael P.\nCSCI 499 	IND 	Senior Research Project 				Banik, Shankar M.\nCRMJ 392 	OL1 	Cybercrime 				Navarro, Jordana ."




When /^(?:|I )add my schedule$/ do
visit path_to("the users_profile page")
     fill_in("schedule_field", :with => schedule)
     click_button("Add Schedule")
end

