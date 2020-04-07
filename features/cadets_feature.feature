Feature: Testing Cadets View

  As an xo 
  I want to see my people's schedules in a spreadsheet view
  So that I have it handy

  Scenario: XO sees table with everybody's personal schedules
    When I am on the first cadet's page
    Then I should see "Details about Maria Contreras"
