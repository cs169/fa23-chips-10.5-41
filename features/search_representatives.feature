Feature: Search and view representatives by location

Background: On the representatives page

  Given I am on the representatives page
  Then I should see "Search for a Representative"

Scenario: Search for representatives at your location
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  Then I should see "Gavin Newsom"
  And I should see "Ken Calvert"

Scenario: View a representative of your location
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  And I click on the profile button for "Ken Calvert"
  Then I should see "2205 Rayburn House Office Building, Washington, DC, 20515"
