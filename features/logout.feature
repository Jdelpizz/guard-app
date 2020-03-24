Feature: Allows users to logout

As an user
So I can logout of an account
To ensure privacy and security of the account

Background: I am logged in

  Given I have logged in as admin
  And I go to the test_auth page
  Then I should see "You have access to this page, admin"
  Then I go to the home page

Scenario: I am logged in and I logout
  When I click "Logout"
  Then I go to the test_auth page
  Then I should not see "You have access to this page"

Scenario: I am logged out and I logout
  When I click "Logout"
  Then I should see "You are not logged in."