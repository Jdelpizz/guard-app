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

  Scenario: I create a user without CWID
  When I create the user "admin" "1AnnoyingPassword!" " "
  Then I should see "Please enter your CWID"
