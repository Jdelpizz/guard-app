Feature: Allows xo to create new cadets

As an xo
So I can create a new cadet

Background: I am on the Spreadsheet page
  Given I go to the New Cadet page

Scenario: I create a cadet
  When I create the cadet "10621790"
  Then I should see "Cadet was created successfully."