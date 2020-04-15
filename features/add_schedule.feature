Feature: Allows users to add a schedule

As a guard
So I do not get scheduled during a class
I want to add my class schedule

Background: I am on the homepage
  When I create the user "admin" "1AnnoyingPassword!" "11111111"
  When I create the cadet "John" "Marc" "Doe" "Senior" "Romeo" "5432" "800-555-1356" "jdoe56@citadel.edu" "Private" 
  When I go to the homepage

Scenario: I add my schedule
  When I add my schedule
  Then I should see "Schedule Updated"

Scenario: I add nothing
  When I press "User Profile"
  Then I press "Add Schedule"
  Then I should see "Schedule Updated" 
 