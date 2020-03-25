Feature: Testing Cadets View

  As an xo 
  I want to see my people's schedules in a spreadsheet view
  So that I have it handy

  Scenario: XO sees table with everybody's schedules
    Given I am on the xo's page
    Then I should see the spreadsheet
