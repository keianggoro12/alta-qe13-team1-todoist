Feature: Get project
@Todoist
  #GSP001
  Scenario: Get all project
    Given Get all project
    When Send request get all project
    Then Status code should be 200
    And Validate get project json schema "GetProjectSchema.json"