Feature: Get Section
  @Todoist
  #GAS001
  Scenario: Get all sections
    Given Get all sections
    When Send request get all sections
    Then Status code should be 200
    And Validate get section json schema "GetAllSectionsSchema.json"

  @Todoist
   #GAS002
  Scenario Outline: Get all section with project_id
    Given Get all section with "<project_id>"
    When Send request get single section
    Then Status code should be 200
    And Validate get section json schema "GetSingleProjectSchema.json"
    Examples:
      | project_id |  |
      | 2325681395 |  |

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