Feature: Post project

  #CSP001
  @Todoist
  Scenario Outline:Create single project with name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        |
      | waduh | CSP001.json |

 #CSP002
  @Todoist
  Scenario Outline:Create single project with registered name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        |
      | waduh | CSP001.json |

   #CSP003
  @Todoist
  Scenario Outline:Create single project with name using special character
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        |
      | !@#!@#!@ | CSP003.json |

   #CSP004
  @Todoist
  Scenario Outline:Create single project with name using numeric
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        |
      | 23156 | CSP004.json |

  #CSP005
  @Todoist
  Scenario Outline:Create single project without name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    And Response body should "Name must be provided for the project creation"
    Examples:
      |  | json        |
      |  | CSP005.json |

  #CSP006
  @Todoist
  Scenario Outline:Create single project with name and color name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>" and color was "<color>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name | json        | color     |
      | saru | CSP006.json | berry_red |

  #CSP006
  @Todoist
  Scenario Outline:Create single project with name and color id
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    And Response body should "Color format is not valid"
    Examples:
      | json        |
      | CSP007.json |

  #CSP008
  @Todoist
  Scenario Outline:Create single project with name and color using hexadecimal
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    And Response body should "Color format is not valid"
    Examples:
      | json        |
      | CSP008.json |

  #CSP009
  @Todoist
  Scenario Outline:Create single project with name and invalid color name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    And Response body should "Color format is not valid"
    Examples:
      | json        |
      | CSP009.json |

  #CSP010
  @Todoist
  Scenario Outline:Create single project with name and is favorite is boolean
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>" and is favorite is "true"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name | json        |
      | tori | CSP010.json |

  #CSP011
  @Todoist
  Scenario Outline:Create single project with name and is favorite is not boolean
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    Examples:
      | json        |
      | CSP011.json |

  #CSP012
  @Todoist
  Scenario Outline:Create single project with name and valid view style
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>" and view style was "<view style>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name  | json        | view style |
      | iyahh | CSP012.json | list       |

#CSP013
  @Todoist
  Scenario Outline:Create single project with name and valid view style
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    Examples:
      | json        |
      | CSP013.json |

#CSP014
  @Todoist
  Scenario Outline:Create single project with using all of parameters
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 200
    And Response body return name was "<name>" is favorite was "<is_favorite>" color was "<color>" and view style was "<view style>"
    And Validate post project json schema "PostProjectSchema.json"
    Examples:
      | name    | json        | view style | color    | is_favorite |
      | projss2 | CSP014.json | list       | charcoal | true        |


#CSP015
  @Todoist
  Scenario Outline:Create single project with using all of parameters except name
    Given Create single project with "<json>"
    When Send request post project
    Then Status code should be 400
    Examples:
      | json        |
      | CSP015.json |