Feature: Login functions

Background: On the login page
  Given I am on the login page
  Then I should see "Sign in with Google"
  And I should see "Sign in with GitHub"

Scenario: Google Login
  Given I am on the login page
  Then I press "Sign in with Google"

Scenario: GitHub Login
  Given I am on the login page
  Then I press "Sign in with GitHub"