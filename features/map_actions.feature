Feature: Using the map

Background: On the home page
  Given I am on the homepage
  Then I should see "National Map"

Scenario: User views representatives by clicking on a county from the state map
  When I visit the map page for state CA
  And I click on county Alameda County
  Then I should see representative Henry C. Levy
  Then I should see representative Yesenia Sanchez
  Then I should see representative Kelli Evans
  Then I should see representative Joseph R. Biden

Scenario: User attempts to visit non existent state
  When I visit the map page for state CL
  Then I should see "State 'CL' not found."