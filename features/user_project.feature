@selenium, @javascript
Feature:  Project creation
  As a user
  I want to be able to create projects

  Scenario: User is singed in, so he can create new project
    Given I am signed in user
    When I go to "Create new project" link
    Then I see project creation form
    When I "create_project" with "valid_p_data" data
    Then I see message "Project was successfully created."
    And I see created project main view
    And I see created project menu
    And I see my projects menu with created project in list
