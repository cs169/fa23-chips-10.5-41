Feature: Map Interaction

Scenario: State Click
  Given I am on the home page
  When I click state "NY"

Scenario: Visit profile
  When I go to profile "John Smith"

Scenario: Press edit button for news item
  When I visit url representatives/1/representatives/1/my_news_item/1
  When I press "Save"

Scenario: Search representative
  Given I am on the home page
  When I visit url representatives
  When I fill in "address" with "California"
  When I press "Search"
  When I follow "Gavin Newsom"
  
Scenario: Visit news items
  When I visit url representatives/1/news_items
  When I press "Edit"
  When I visit url representatives/1/news_items
  When I press "Add News Article"

Scenario: Visit news items 2
  When I visit url representatives/1/representatives/1/my_news_item/new
  When I visit url representatives/1/news_items/1

Scenario: View representative
  Given I am on the home page
  When I visit url representatives
  When I visit url representatives/1
  Then I should see "Gavin Newsom"
  When I visit url representatives/1/representatives/1/my_news_item/new
  Then I should see "Edit news article"

Scenario: Create news article for representative
  Given I am on the home page
  When I visit url representatives/1/representatives/1/my_news_item/new
  Then I should see "Edit news article"

Scenario: Create event
  When I create event "Birthday Party"

Scenario: Ajax functionality
  Given I am on the home page
  When I visit url ajax/state/NY

Scenario: County search
  Given I am on the home page
  When I click state "NY"
  When I search county in NY "001"

Scenario: Search Empty address
  Given I am on the home page
  When I visit url representatives
  Then I should be on the representatives page


Scenario: Fill in state name
  Given I am on the representatives page
  And I fill in "address" with "New York"
  And I press "Search"

Scenario: Visit state on map
  Given I am on the home page
  When I visit url state/NY
  Then I should see "New York"
  When I press "Counties in New York"

Scenario: Events page
  Given I am on the events page
  Then I should see "Reset Filters"
  Then I should see "Add New Event"

