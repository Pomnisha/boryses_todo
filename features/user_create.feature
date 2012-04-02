@selenium, @javascript
Feature:  Sign up
  In order to get access to site functionality
  As not a user
  I want to be able to sign up

  Scenario: User is not singed in, so he can see only about page
    Given I am not user of the system
    When I go to main page
    Then I see main menu for not signed in users
    And I don't see right menu
    And I see about page
    When I go to "Home" link
    Then I see about page
    When I go to "Sign in" link
    Then I see Sign in form
    When I go to "Sign up" link
    Then I see Sign up form

  Scenario: User is not signed in and he wants to get access to the site functionality
    Given I am not user of the system
    When I go to main page
    And I go to "Sign in" link
    Then I see Sign in form
    When I "sign_in" with "invalid_user" data
    Then I see Sign in form
    And I see message "Invalid email or password"

  Scenario: User is not signed in, so he wants to become registered user
    Given I am not user of the system
    When I go to main page
    And I go to "Sign up" link
    Then I see Sign up form
    When I "sign_up" with "valid_user" data
    Then I can see my homepage
    And I see my activities menu