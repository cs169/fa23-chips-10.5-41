Feature: Use the navbar to access important pages

Background: On the home page
  Given I am on the homepage
  Then I should see "National Map"

Scenario: Go to the representatives search page
  When I follow "Representatives"
  Then I should see "Search for a Representative"

Scenario: Go to the campaign finances search page
  When I follow "Campaign Finances"
  Then I should see "Search for a Cycle"

Scenario: Go back to the national map
  Given I am on the representatives page
  When I follow "National Map"
  Then I should be on the home page