Feature: Be able to view/add articles of a representative

Background: On the representatives page of a county
  Given I am on the representatives page
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  Then I should see "Gavin Newsom"
  When I click on the news button for "Gavin Newsom"
  Then I should see "Listing News Articles for Gavin Newsom"