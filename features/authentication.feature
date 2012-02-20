Feature: Authentication

  In order to do authentication
  As a guest or user
  I want sign up, sign in and sign out

  Scenario: Sign up successful
    Given I am a guest
    And I go to the homepage
    When I follow "Sign up"
    And I fill in "Username" with "testuser"
    And I fill in "Email" with "test@example.com"
    And I fill in "Password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I press "Create new user"
    Then I should be on the homepage
    And I should be login

  @wip
  Scenario Outline: Sign up fail
    Given I am a guest
    And I go to the homepage
    When I follow "Sign up"
    And I fill in "Username" with "<username>"
    And I fill in "Email" with "<email>"
    And I fill in "Password" with "<password>"
    And I fill in "Password confirmation" with "<passord_confirmation>"
    And I press "Create new user"
    Then I should be on the the sign up page
    And I should see "<message>"

    Scenarios: without presence
      | username | email            | password | password_confirmation | message                   |
      |          | user@example.com | secret   | secret                | Username must be presenc  |
      | testuser |                  | secret   | secret                |                           |
      | testuser | user@example.com |          | secret                |                           |
      | testuser | user@example.com | secret   |                       |                           |



  Scenario: Sign in successful
  Scenario: Sign in fail

  Scenario: Sign out
