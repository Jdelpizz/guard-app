Feature: Allows users to add a schedule

As a guard
So I do not get scheduled during a class
I want to add my class schedule

# Idea
  # add a cadet
  # add the schedule
  # create a new class for unique times
  # create an enrollment to match cadet to class

# Future
  # OX opens dropdown menu for spreadsheets cell
    # spreadsheet is a table of [day][time]
  # dropdown is populated
    # select cadets.lname, cadets.fname
    # from cadets
    # join enrollments on cadets.cwid == enrollments.cwid
    # join classes on enrollments.class_id == classes.class_id
    # where classes.day != spreadsheet[day]
    # where classes.time != spreadsheet[day][time]


Background: I am on the homepage
#add a cadet
  Given I create the test user
  Given I create the test cadet
  Given I go to the homepage

Scenario: I add nothing
  When I press "User Profile"
  Then I press "Add Schedule"
  Then I should see "Schedule Updated" 

Scenario: I add my cas schedule
  # add the schedule
  When I add my cas schedule
  Then I should see "Schedule Updated"
  Then the db should have my schedule
  # create a new class for unique times
  Then the db should have my classes
  # create an enrollment to match cadet to class
  Then the db should have my enrollments

Scenario: I add my lesesne schedule
  # add the schedule
  When I add my lesesne schedule
  Then I should see "Schedule Updated"
  Then the db should have my schedule
  # create a new class for unique times
  Then the db should have my classes
  # create an enrollment to match cadet to class
  Then the db should have my enrollments

  
