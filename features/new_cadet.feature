Feature: xo can manually add a new cadet
 
Scenario: Add a cadet
    Given I am on the Spreadsheet page
    Then I go to the New Cadet page
    Then I should see "Enter in new Cadet"
    