Feature: Update project

  @Todoist
  #USP001
  Scenario Outline:Update project name with valid project_id
    Given Update single project with "<project_id>" and "<json>"
    When Send request update project
    Then Status code should be 200
    And Response body return name was "<name>"
    And Validate update project json schema "UpdateProjectSchema.json"
    Examples:
      | name   | json        | project_id |
      | waduhh | USP001.json | 2325748494 |

  @Todoist
  #USP002
  Scenario Outline:Update project color with valid project_id
    Given Update single project with "<project_id>" and "<json>"
    When Send request update project
    Then Status code should be 200
    And Response body return color was "<color>"
    And Validate update project json schema "UpdateProjectSchema.json"
    Examples:
      | color    | json        | project_id |
      | charcoal | USP002.json | 2325748494 |

  @Todoist
  #USP003
  Scenario Outline:Update favorite project with valid project_id
    Given Update single project with "<project_id>" and "<json>"
    When Send request update project
    Then Status code should be 200
    And Response body return is favorite was "true"
    And Validate update project json schema "UpdateProjectSchema.json"
    Examples:
      | json        | project_id |
      | USP003.json | 2325748494 |

  @Todoist
  #USP004
  Scenario Outline:Update project view style with valid project_id
    Given Update single project with "<project_id>" and "<json>"
    When Send request update project
    Then Status code should be 200
    And Response body return view style was "<view style>"
    And Validate update project json schema "UpdateProjectSchema.json"
    Examples:
      | view style | json        | project_id |
      | list       | USP004.json | 2325748494 |

  @Todoist
  #USP005
  Scenario Outline:Update all parameter project with valid project_id
    Given Update single project with "<project_id>" and "<json>"
    When Send request update project
    Then Status code should be 200
    And Response body return name was "<name>" is favorite was "<is_favorite>" color was "<color>" and view style was "<view style>"
    And Validate update project json schema "UpdateProjectSchema.json"
    Examples:
      | name    | json        | view style | color     | is_favorite | project_id |
      | wadidaw | USP005.json | list       | berry_red | false       | 2325748494 |

  @Todoist
  #USP006
  Scenario Outline:Update project name with invalid project_id
    Given Update single project with "<project_id>" and "<json>"
    When Send request update project
    Then Status code should be 404
    And Response body should "Project not found"
    Examples:
      |  | json        | project_id |
      |  | USP006.json | 232568136923123 |

  @Todoist
  #USP007
  Scenario Outline:Update project name with unregistered project_id
    Given Update single project with "<project_id>" and "<json>"
    When Send request update project
    Then Status code should be 404
    And Response body should "Project not found"
    Examples:
      |  | json        | project_id |
      |  | USP007.json | 2325681369 |

  @Todoist
  #USP008
  Scenario Outline:Update project name without project_id
    Given Update single project with "<project_id>" and "<json>"
    When Send request update project
    Then Status code should be 404
    And Response body should "Project not found"
    Examples:
      |  | json        | project_id |
      |  | USP008.json |            |

