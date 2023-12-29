Feature: Delete project
  @Todoist
  #DSP001
  Scenario Outline: Delete single project with valid project_id
    Given Delete project with "<project_id>"
    When Send request delete project
    Then Status code should be 204
    Examples:
      | project_id |
      | 2325692831 |

  @Todoist
  #DSP002
  Scenario Outline: Delete single project without project_id
    Given Delete project with "<project_id>"
    When Send request delete project
    Then Status code should be 405
    Examples:
      | project_id |
      |            |

  @Todoist
  #DSP003
  Scenario Outline: Delete single project with invalid project_id
    Given Delete project with "<project_id>"
    When Send request delete project
    Then Status code should be 204
    Examples:
      | project_id |
      | 23256928311234 |

  @Todoist
  #DSP004
  Scenario Outline: Delete single project with unregistered project_id
    Given Delete project with "<project_id>"
    When Send request delete project
    Then Status code should be 204
    Examples:
      | project_id |
      | 2325692831 |




