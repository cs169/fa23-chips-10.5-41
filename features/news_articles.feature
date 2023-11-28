Feature: Be able to view/add articles of a representative

Background: On the representatives page of a county
  Given I am logged in with Google
  And I am on the representatives page
  When I fill in "address" with "650 S Main St, Corona, CA 92882"
  And I press "Search"
  Then I should see "Ken Calvert"
  When I click on the news button for "Ken Calvert"
  Then I should see "Listing News Articles for Ken Calvert"

Scenario: Add news items
  When I click the "Add News Article" link
  Then I should see "Edit news article"
  When I fill in "Title" with "Hannity wants red vs blue"
  And I fill in "Link" with "https://www.politico.com/news/2023/11/27/hannity-desantis-newsom-debate-00128666"
  And I fill in "Description" with "brother wants to debate for real"
  And I select "Ken Calvert" from "Representative"
  And I press "Save"
  Then I should see "News item was successfully created."
