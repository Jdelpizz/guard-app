Feature: Allows users to logout

As an user
So I can logout of an account
To ensure privacy and security of the account

Background: I am logged in
  Given I create the user "admin" "1AnnoyingPassword!"
  Given I login with "admin" and "1AnnoyingPassword!"
  Then I go to the home page

Scenario: I am logged in and I logout
  When I press "Logout"
  Then I go to the authorized page
  Then I should not see "You have access to this page"

Scenario: I am logged out and I logout
  When I press "Logout"
  Then I should see "You are not logged in."