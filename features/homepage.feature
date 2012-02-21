Feature: Homepage

  In order to see homepage
  As a guest
  I want go to the page

  Scenario: Show homepage
    Given I am a guest
    When I go to the homepage
    Then I should be on the homepage
