Feature: Delete method demo

  Scenario: Delete API demo
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204
    And print responseStatus
    And print response