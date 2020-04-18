Feature: Allows users to add a schedule

As a guard
So I do not get scheduled during a class
I want to add my class schedule

Background: I am on the homepage
  Given I create the test user
  Given I create the test cadet
  Given I go to the homepage

Scenario: I add my cas schedule
  When I add my cas schedule
  Then I should see "Schedule Updated"
  Then the db should have my schedule

Scenario: I add my lesesne schedule
  When I add my lesesne schedule
  Then I should see "Schedule Updated"
  Then the db should have my schedule

Scenario: I add nothing
  When I press "User Profile"
  Then I press "Add Schedule"
  Then I should see "Schedule Updated" 
 