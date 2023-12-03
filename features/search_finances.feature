Feature: Search and view campaign finances by cycle and category

Background: On the campaign finances page
  Given I am on the campaign_finances page
  Then I should see "Search for a Cycle"

Scenario: Search for a specific cycles category
  When I fill in "cycle" with "2020"
  And I fill in "category" with "candidate-loan"
  And I press "Search"
  Then the table should have 20 rows
  And I should see "BEHRMAN, DAN TAXATION IS THEFT"
  And I should see "COLLINS, GENEVIEVE D"