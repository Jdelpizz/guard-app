Feature: Testing Cadets View

  As an xo 
  I want to see my people's schedules in a spreadsheet view
  So that I have it handy
  
  Background: I am on the homepage
  Given I create the user "admin" "1AnnoyingPassword!" "11111111"
  When I create the cadet "John" "Marc" "Doe" "Senior" "Romeo" "5432" "800-555-1356" "jdoe56@citadel.edu" "Private" 

  Scenario: XO sees table with everybody's personal schedules
    When I am on the Spreadsheet page
    Then I should see "Maria"
    Then I should see "Contreras"
    Then I should see "0800"
    Then the cwid of "Contreras" should be "10621790"
    
    
  
