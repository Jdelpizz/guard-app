Feature: Allows users to logout

As an user
So I can logout of an account
To ensure privacy and security of the account

Background: I am logged in
  When I create the user "admin" "1AnnoyingPassword!" "11111111"
  When I create the cadet "John" "Marc" "Doe" "Senior" "Romeo" "5432" "800-555-1356" "jdoe56@citadel.edu" "Private"
  Then I logout
  Then I go to the home page

Scenario: I am logged out and I logout
  Given I go to the home page
  Then I should see "Please Sign In"
  When I press "Logout"
  Then I should see "Please Sign In"
  Then I go to the Spreadsheet page
  Then I should not see "Company Spreadsheet"
  
Scenario: I am logged in and I logout
  Given I login with "admin" and "password"
  Then I go to the home page
  When I press "Logout"
  Then I should see "Please Sign In"
  Then I go to the Spreadsheet page
  Then I should not see "Company Spreadsheete"


