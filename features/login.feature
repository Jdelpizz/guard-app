Feature: Allows users to login

As an user
So I can login with an account
To ensure privacy and security of users

Background: I am on the homepage
  Given I create the user "admin" "1AnnoyingPassword!"

Scenario: I login with admin
  When I login with "admin" and "1AnnoyingPassword!"
  Then I should see "admin"
  Then I go to the spreadsheet_index page
  Then I should see "Company Spreadsheet"
  

Scenario: I login to an unknown account
  When I login with "admin" and "1AnnoyingPassword@"
  Then I should see "Invalid Username or Password"