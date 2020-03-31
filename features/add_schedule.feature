Feature: Allows users to add a schedule

As a guard
So I do not get scheduled during a class
I want to add my class schedule

Background: I am on the homepage
  Given I create the user "guard1" "1AnnoyingPassword!"

Scenario: I add my schedule
  When I should see "Company Spreadsheet"
  When I add schedule " "
  Then I should see "Cadet Spreadsheet"
  Then I should see " "
