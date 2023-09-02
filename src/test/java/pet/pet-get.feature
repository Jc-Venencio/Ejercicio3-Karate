Feature: Get pet list

  Background:
    * def namesRepeatedCountList =
        """
        function countByStreamGroupBy(names) {
          return names.reduce((name, curr) => {
          name[curr] = (name[curr] || 0) + 1;
          return name;
          }, {});
        }
        """

  @getPetList
  Scenario: Get pet list
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus?status=sold'
    When method get
    Then status 200
    * def ids = $response[*].id
    * def names = $response[*].name
    * def fullPetList = response.map(x=> [x.id + ", " + x.name])
    * print fullPetList
    * print namesRepeatedCountList(names)


