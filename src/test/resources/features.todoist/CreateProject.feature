Feature: Post project
  @Todoist
  #CSP001
  Scenario Outline:Create single project with name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        |
      | waduh | CSP001.json |

  @Todoist
  #CSP002
  Scenario Outline:CCreate single project with registered name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        |
      | waduh | CSP001.json |

  @Todoist
  #CSP003
  Scenario Outline:Create single project with name using special character
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        |
      | !@#!@#!@ | CSP003.json |

  @Todoist
  #CSP004
  Scenario Outline:Create single project with name using numeric
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        |
      | 23156 | CSP004.json |

  @Todoist
  #CSP005
  Scenario Outline:Create single project without name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    And Response body should "Name must be provided for the project creation"
    Examples:
      |  | json        |
      |  | CSP005.json |

  @Todoist
  #CSP006
  Scenario Outline:Create single project with name and color name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>" and color was "<color>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name | json        | color     |
      | saru | CSP006.json | berry_red |

  @Todoist
  #CSP007
  Scenario Outline:Create single project with name and color id
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    And Response body should "Color format is not valid"
    Examples:
      | json        |
      | CSP007.json |

  @Todoist
  #CSP008
  Scenario Outline:Create single project with name and color using hexadecimal
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    And Response body should "Color format is not valid"
    Examples:
      | json        |
      | CSP008.json |

  @Todoist
  #CSP009
  Scenario Outline:Create single project with name and invalid color name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    And Response body should "Color format is not valid"
    Examples:
      | json        |
      | CSP009.json |

  @Todoist
  #CSP010
  Scenario Outline:Create single project with name and is favorite is boolean
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>" and is favorite is "true"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name | json        |
      | tori | CSP010.json |

  @Todoist
  #CSP011
  Scenario Outline:Create single project with name and is favorite is not boolean
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    Examples:
      | json        |
      | CSP011.json |

  @Todoist
  #CSP012
  Scenario Outline:Create single project with name and valid view style
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>" and view style was "<view style>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        | view style |
      | iyahh | CSP012.json | list       |

  @Todoist
  #CSP013
  Scenario Outline:Create single project with name and valid view style
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    Examples:
      | json        |
      | CSP013.json |

  @Todoist
  #CSP014
  Scenario Outline:Create single project with using all of parameters
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>" is favorite was "<is_favorite>" color was "<color>" and view style was "<view style>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name    | json        | view style | color    | is_favorite |
      | projss2 | CSP014.json | list       | charcoal | true        |

  @Todoist
  #CSP015
  Scenario Outline:Create single project with using all of parameters except name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    Examples:
      | json        |
      | CSP015.json |