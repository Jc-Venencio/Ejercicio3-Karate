Feature: Post and Get an user on Petstore

  @Create
  Scenario: Post User
    * def createData = read('/user-post-request.json')
    Given url "https://petstore.swagger.io/v2/user"
    And request createData
    When method post
    Then status 200
    And match $.code == 200


  @CheckData
  Scenario: Get user by username
    Given url "https://petstore.swagger.io/v2/user/JCV-User"
    When method get
    Then status 200
    And match $.username == 'JCV-User'
    * print response