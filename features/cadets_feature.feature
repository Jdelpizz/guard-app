Feature: Testing Cadets View

  As an xo 
  I want to see my people's schedules in a spreadsheet view
  So that I have it handy
  
  Background: I am on the homepage
  Given I create the user "admin" "1AnnoyingPassword!"

  Scenario: XO sees table with everybody's personal schedules
    When I am on the Spreadsheet page
    Then I should see "Maria"
    Then I should see "Contreras"
    Then I should see "0800"
    Then the cwid of "Contreras" should be "10621790"
    
    
  
