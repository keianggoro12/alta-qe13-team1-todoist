Feature: Get project
@Todoist
  #GSP001
  Scenario: Get all project
    Given Get all project
    When Send request get all project
    Then Status code should be 200
    And Validate get project json schema "GetAllProjectsSchema.json"

  @Todoist
   #GSP002
  Scenario Outline: Get single project with valid project_id
    Given Get single project with "<project_id>"
    When Send request get single project
    Then Status code should be 200
    And Validate get project json schema "GetSingleProjectSchema.json"
    Examples:
      | project_id |  |
      | 2325748494 |  |

  @Todoist
    #GSP003
  Scenario Outline: Get single project with invalid project_id
    Given Get single project with "<project_id>"
    When Send request get single project
    Then Status code should be 404
    And Response body should "Project not found"
    Examples:
      | project_id |  |
      | 23172312313123123121 |  |

  @Todoist
    #GSP004
  Scenario Outline: Get single project with unregistered project_id
    Given Get single project with "<project_id>"
    When Send request get single project
    Then Status code should be 404
    And Response body should "Project not found"
    Examples:
      | project_id |  |
      | 2325681396 |  |

  @Todoist
    #GSP005
  Scenario Outline: Get single project without project_id
    Given Get single project with "<project_id>"
    When Send request get single project
    Then Status code should be 404
    And Response body should "Project not found"
    Examples:
      | project_id |  |
      |            |  |