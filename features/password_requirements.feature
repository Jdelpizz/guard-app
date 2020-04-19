Feature: Password Requirements
  As an admin
  So I can protect users
  I want to have password Requirements for users

Background: I am on the homepage
  Given params is empty
  Then I go to the home page

Scenario: I make user with good password
  When I create the user "admin" "1AnnoyingPassword!"
  Then I should see "Welcome!"
  Then I should not see "Please use a longer password"
  Then I should not see "Please include a symbol."
  Then I should not see "Please include a number."
  Then I should not see "Please include an uppercase letter."
  Then I should not see "Please include a lowercase letter."

Scenario: I make a password too short
  When I create the user "admin" "Password1!"
  Then I should see "Please use a longer password"
  Then I should not see "Please include a symbol."
  Then I should not see "Please include a number."
  Then I should not see "Please include an uppercase letter."
  Then I should not see "Please include a lowercase letter."

Scenario: I make user without symbol
  When I create the user "admin" "1AnnoyingPassword"
  Then I should see "Please include a symbol."
  Then I should not see "Please use a longer password"
  Then I should not see "Please include a number."
  Then I should not see "Please include an uppercase letter."
  Then I should not see "Please include a lowercase letter."


Scenario: I make user without number
  When I create the user "admin" "AnnoyingPassword!"
  Then I should see "Please include a number."
  Then I should not see "Please use a longer password"
  Then I should not see "Please include a symbol."
  Then I should not see "Please include an uppercase letter."
  Then I should not see "Please include a lowercase letter."

Scenario: I make user without uppercase
  When I create the user "admin" "1annoyingpassword!"
  Then I should see "Please include an uppercase letter."
  Then I should not see "Please use a longer password"
  Then I should not see "Please include a symbol."
  Then I should not see "Please include a number."
  Then I should not see "Please include a lowercase letter."

Scenario: I make a user without lowercase
  When I create the user "admin" "ANNOYINGPASSWORD1!"
  Then I should see "Please include a lowercase letter."
  Then I should not see "Please use a longer password"
  Then I should not see "Please include a symbol."
  Then I should not see "Please include a number."
  Then I should not see "Please include an uppercase letter."
