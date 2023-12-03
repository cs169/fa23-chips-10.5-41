Feature: Search and view campaign finances by cycle and category

Background: On the campaign finances page
  Given I am on the campaign_finances page
  Then I should see "Search for a Cycle"

Scenario: Search for a specific cycles category
  When I select "2020" from "cycle"
  And I select "candidate-loan" from "category"
  And I press "Search"
  Then the table should have 20 rows
  And I should see "BEHRMAN, DAN TAXATION IS THEFT"
  And I should see "COLLINS, GENEVIEVE D"