require 'uri'
require 'cgi'
#https://www.freeformatter.com/java-dotnet-escape.html#ad-output
cas_schedule = "Class Schedule \nCourse 	Class Type 	Title 	Days 	Time 	Location 	Instructor \nAERO 402 	LEC 	Natl Secur Aff/Prep for AD II 	MWF 	0800-0850 	Jenkins Hall 305 	Yerage, Edward .\nELEC 330 	LEC 	Digital Systems Engr 	TR 	0930-1045 	Grimsley Hall 305 	Hayne, Ronald J.\nAERO 450 	LAB 	USAF Contract Training Lab 	R 	1600-1800 	Jenkins Hall 101 	Thurber, Kathleen .\nCSCI 421 	LEC 	Software Engineering Practicum 	TR 	1100-1215 	Thompson Hall 319 	Verdicchio, Michael P.\nCSCI 499 	IND 	Senior Research Project 				Banik, Shankar M.\nCRMJ 392 	OL1 	Cybercrime 				Navarro, Jordana ."
lesesne_schedule = "10019 \tAERO 402 01 \tNatl Secur Aff/Prep for AD II \tCitadel Main Campus \t3.000 \tUG \tJan 15, 2020 \tApr 28, 2020 \tMWF \t8:00 am - 8:50 am \tJenkins Hall 305 \tYerage\r\n11476 \tAERO 450 01 \tUSAF Contract Training Lab \tCitadel Main Campus \t0.000 \tUG \tJan 15, 2020 \tApr 28, 2020 \tR \t4:00 pm - 6:00 pm \tJenkins Hall 101 \tThurber\r\n14676 \tCRMJ 392 W2 \tCybercrime \tCitadel Main Campus \t3.000 \tUG \tJan 13, 2020 \tApr 27, 2020 \t  \tTBA \tTBA \tNavarro\r\n12476 \tCSCI 421 01 \tSoftware Engineering Practicum \tCitadel Main Campus \t3.000 \tUG \tJan 15, 2020 \tApr 28, 2020 \tTR \t11:00 am - 12:15 pm \tThompson Hall 319 \tVerdicchio\r\n13619 \tCSCI 499 01 \tSenior Research Project \tCitadel Main Campus \t3.000 \tUG \tJan 15, 2020 \tApr 28, 2020 \t  \tTBA \tTBA \tBanik\r\n10410 \tELEC 330 01 \tDigital Systems Engr \tCitadel Main Campus \t3.000 \tUG \tJan 15, 2020 \tApr 28, 2020 \tTR \t9:30 am - 10:45 am \tGrimsley Hall 305 \tHayne"
test_cwid = 11111111


When /^(?:|I )add my (lesesne|cas) schedule$/ do |schedule|
     visit path_to("the users_profile page")
     if (schedule) == "cas"
          fill_in("schedule_field", :with => cas_schedule)
     end
     if (schedule) == "lesesne"
          fill_in("schedule_field", :with => lesesne_schedule)
     end
     click_button("Add Schedule")
end

#deprecated [replaced with the db should have my classes/enrollments]
When /^the db should have my schedule$/ do
     cadet = Cadets.where(CWID: test_cwid).take
     # monday
          field_value = '["0800-0850"]'
          field_value = parse_to_arr(field_value)
          expect(parse_to_arr(cadet["monday"])).to eq(field_value)
     # tuesday
          field_value = '["0930-1045", "1100-1215"]'
          field_value = parse_to_arr(field_value)
          expect(parse_to_arr(cadet["tuesday"])).to eq(field_value) 
     # wednesday
          field_value = '["0800-0850"]'
          field_value = parse_to_arr(field_value)
          expect(parse_to_arr(cadet["wednesday"])).to eq(field_value) 
     # thursday
          field_value = '["0930-1045", "1600-1800", "1100-1215"]'
          field_value = parse_to_arr(field_value)
          expect(parse_to_arr(cadet["thursday"])).to eq(field_value) 
     # friday
          field_value = '["0800-0850"]'
          field_value = parse_to_arr(field_value)
          expect(parse_to_arr(cadet["friday"])).to eq(field_value)     
end

def parse_to_arr(day)
     day.tr!("\"","")
     day.tr!(" ","")
     day.tr!("\[","")
     day.tr!("\]","")
     if day.include?(",")
          day = day.split(",")
     else
          day = [day]
     end
     day.sort!
     return day
end

When /^the db should have my classes$/ do
     classes?("monday", ["0800-0850"])
     classes?("tuesday", ["0930-1045", "1100-1215"])
     classes?("wednesday", ["0800-0850"])
     classes?("thursday", ["0930-1045", "1600-1800", "1100-1215"])
     classes?("friday", ["0800-0850"])
end

def classes?(day, time_arr)
     #pull all classes for the day
          classes = Classes.where(DAY: day.upcase)
     #for each class in the day, take the one with the right start and end time
          time_arr.each do |time|
               #remove spaces (there shouldn't be in the first place)
                    time.tr!(" ","")
               #split the start and end times
                    time = time.split("-")
               #all classes with the same start times
                    tmp_classes = classes.where(START_TIME: time[0])
               #there should be one with the right end time
                    expect(tmp_classes.where(END_TIME: time[1]).take).not_to eq(nil)
          end
end

Then(/^the db should have my enrollments$/) do
     enrollments?(test_cwid, "monday", ["0800-0850"])
     enrollments?(test_cwid, "tuesday", ["0930-1045", "1100-1215"])
     enrollments?(test_cwid, "wednesday", ["0800-0850"])
     enrollments?(test_cwid, "thursday", ["0930-1045", "1600-1800", "1100-1215"])
     enrollments?(test_cwid, "friday", ["0800-0850"])     
end

def enrollments?(cwid, day, time_arr)
     enrollments = Enrollments.where(CWID: cwid)
     class_ids_arr = arr_class_ids(day, time_arr)
     class_ids_arr .each do |class_id|
          expect(enrollments.where(CLASS_ID: class_id).take).not_to eq(nil)
     end 
end

def arr_class_ids(day, time_arr)
     #pull all classes for the day
          classes = Classes.where(DAY: day.upcase)
          class_id_list = []
     #for each class in the day, take the one with the right start and end time
          time_arr.each do |time|
               #remove spaces (there shouldn't be in the first place)
                    time.tr!(" ","")
               #split the start and end times
                    time = time.split("-")
               #all classes with the same start times
                     tmp_classes = classes.where(START_TIME: time[0])
               #return id of class with same end time
                   class_id_list << tmp_classes.where(END_TIME: time[1]).take[:CLASS_ID]
          end
     return class_id_list
end
