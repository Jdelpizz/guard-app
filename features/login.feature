Feature: Allows users to login

As an user
So I can login with an account
To ensure privacy and security of users

Background: I am on the homepage

  When I go to root

Scenario: I login with admin
  When I press "Login"
  Then I 
  Then I go to test_auth page
  Then I should not see "You have access to this page"

Scenario: I login to an unknown account
  When I press "Login"

  Then I should see "Invalid Username or Password"