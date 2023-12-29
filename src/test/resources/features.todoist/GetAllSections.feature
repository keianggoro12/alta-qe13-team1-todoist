Feature: Get all sections
  @Todoist
  #GAS001
  Scenario Outline: Get all section with project_id
    Given Get section with "<project_id>"
    When Send request get section
    Then Status code should be 200
    And Validate get project json schema "GetSectionSchema.json"
    Examples:
      | project_id |  |
      | 2325642621 |  |

  @Todoist
  #GAS002
  Scenario Outline: Get all sections with invalid project_id
    Given Get section with "<project_id>"
    When Send request this section
    Then Status code should be 404
    And Response body should "Section not found"
    Examples:
      | project_id |  |
      | 5000 |  |

  @Todoist
  #GAS003
  Scenario Outline: Get all sections with unregistered project_id
    Given Get section with "<project_id>"
    When Send request this section
    Then Status code should be 404
    And Response body should "Section not found"
    Examples:
      | project_id |  |
      | 37849034522 |  |

  @Todoist
  #GAS004
  Scenario Outline: Get all sections without project_id
    Given Get section with "<project_id>"
    When Send request this section
    Then Status code should be 404
    And Response body should "Section not found"
    Examples:
      | project_id |  |
      |            |  |



