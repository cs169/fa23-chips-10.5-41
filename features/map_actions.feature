Feature: Viewing Representatives From Map

  Scenario: User views representatives by clicking on a county from the state map
    When I visit the map page for state CA
    Then I should see the state name California
    And I click on county Alameda County
    Then I should see representative Henry C. Levy
    Then I should see representative Yesenia Sanchez
    Then I should see representative Kelli Evans
    Then I should see representative Joseph R. Biden