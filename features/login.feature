Feature: Allows users to login

As an user
So I can login with an account
To ensure privacy and security of users

Background:
  When I create the test user
  When I create the test cadet
  When I create the user "admin2" "1AnnoyingPassword!" "11111112"

Scenario: I login with admin
  When I login with "admin" and "1AnnoyingPassword!"
  Then I should see "admin"
  Then I go to the spreadsheet_index page
  Then I should see "Company Spreadsheet"

  Scenario: I login with random caps
  When I login with "adMin" and "1AnnoyingPassword!"
  Then I should see "admin"
  Then I go to the spreadsheet_index page
  Then I should see "Company Spreadsheet"  

Scenario: I login to an unknown account
  When I login with "admin" and "1AnnoyingPassword@"
  Then I should see "Invalid Username or Password"

Scenario: I login to an account without a profile
  When I login with "admin2" and "1AnnoyingPassword!"
  Then I should see "Please Create Your Profile"

Scenario: I try to access the guard table without a profile
  When I login with "admin2" and "1AnnoyingPassword!"
  Then I should see "Please Create Your Profile"
  Then I go to the homepage
  Then I press "User Profile"
  Then I should see "Please Create Your Profile"