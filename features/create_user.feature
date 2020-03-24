Feature: Allows users to be created

As an user
So I can create an account
To access a personalized view of the site

Background: I am on the homepage
  Given I go to the home page

Scenario: I create a user
  When I create the user "admin" "password"
  Then I should see "Welcome"

Scenario: I create a user that already exists
  When I create the user "admin" "password"
    Then I should see "Sorry, that account already exists."