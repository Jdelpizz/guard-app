Feature: Allows users to be created

As an user
So I can create an account
To access a personalized view of the site

Background: I am on the homepage
  Given I go to the home page

Scenario: I create a user
  When I create the user "admin" "1AnnoyingPassword!" "11111111"
  Then I should see "Please Create Your Profile"

Scenario: I create a user that already exists
  When I create the user "admin" "1AnnoyingPassword!" "11111111"
  When I create the user "admin" "1AnnoyingPassword!" "11111111"
  Then I should see "Sorry, that account already exists."

Scenario: I create a profile
  When I create the cadet "John" "Marc" "Doe" "Senior" "Romeo" "5432" "800-555-1356" "jdoe56@citadel.edu" "Private" 

Scenario: I create a profile without First Name
  When I create the cadet " " "Marc" "Doe" "Senior" "Romeo" "5432" "800-555-1356" "jdoe56@citadel.edu" "Private" 
  Then I should see "F name can't be blank"
  Then I should see "F name is too short (minimum is 2 characters)"

Scenario: I create a profile without Last Name
  When I create the cadet "John" "Marc" " " "Senior" "Romeo" "5432" "800-555-1356" "jdoe56@citadel.edu" "Private" 
  Then I should see "L name can't be blank"
  Then I should see "L name is too short (minimum is 2 characters)"

Scenario: I create a profile without Email Address
  When I create the cadet "John" "Marc" "Doe" "Senior" "Romeo" "5432" "800-555-1356" " " "Private" 
  Then I should see "Email can't be blank"
  Then I should see "Email is too short (minimum is 5 characters)"

