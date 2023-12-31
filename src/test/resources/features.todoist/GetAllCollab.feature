Feature: Get all collaborators
  @Todoist
  #GAC001
  Scenario Outline: Get all collaborators with valid project_id
    Given Get all collaborators with "<project_id>"
    When Send request get all collaborators
    Then Status code should be 200
    And Validate get project json schema "GetAllCollaboratorsSchema.json"
    Examples:
      | project_id |  |
      | 2325693414 |  |
  @Todoist
  #GAC002
  Scenario Outline: Get all collaborators with valid project_id without permissions
    Given Get all collaborators with "<project_id>"
    When Send request get all collaborators
    Then Status code should be 401
    Examples:
      | project_id |  |
      | 2325642621 |  |

  @Todoist
  #GAC004
  Scenario Outline: Get all collaborators with invalid project_id
    Given Get all collaborators with "<project_id>"
    When Send request get all collaborators
    Then Status code should be 401
    Examples:
      | project_id |  |
      | 232564262123 |  |

  @Todoist
  #GAC005
  Scenario Outline: Get all collaborators without project_id
    Given Get all collaborators with "<project_id>"
    When Send request get all collaborators
    Then Status code should be 404
    Examples:
      | project_id |  |
      |            |  |

