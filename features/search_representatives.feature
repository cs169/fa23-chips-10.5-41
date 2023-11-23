Feature: Search and view representatives by location

Background: On the representatives page

  Given I am on the representatives page
  Then I should see "Search for a Representative"

Scenario: Search for representatives at your location
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  Then I should see "Gavin Newsom"
  And I should see "Ken Calvert"

Scenario: Loading one locations representatives twice
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  Then the table should have 31 rows
  When I go to the representatives page
  And I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  Then the table should have 31 rows

Scenario: View a representatives profile
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  And I click on the profile button for "Ken Calvert"
  Then I should see "2205 Rayburn House Office Building, Washington, DC, 20515"

Scenario: View the news articles of a representative
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  And I click on the news button for "Ken Calvert"
  Then I should see "Listing News Articles for Ken Calvert"