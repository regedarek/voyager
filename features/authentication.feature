Feature: Authentication

  In order to do authentication
  As a guest or user
  I want sign up, sign in and sign out

  @wip
  Scenario: Sign up successful
    Given I am a guest
    And I go to the homepage
    When I follow "sign up"
    And I fill in "username" with "testuser"
    And I fill in "email" with "test@example.com"
    And I fill in "password" with "secret"
    And I fill in "password_confirmation" with "secret"
    And I submit
    Then I should be on the homepage
    And I should be login

  @wip
  Scenario: Sign up fail

  Scenario: Sign in successful
  Scenario: Sign in fail

  Scenario: Sign out
