Feature: POST method Demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response.json')
#  To get file path relative to project
#  def projectPath = java.lang.System.getProperty('user.dir')
#  def projectPath = karate.properties['user.dir']

# Simple Post scenario
  Scenario: Post demo 1
    Given url 'https://reqres.in/api/users'
    And request { "name": "VuNguyen", "job": "QC"}
    When method post
    Then status 201

# Post scenario with Background
  Scenario: Post demo 2
    Given path '/users'
    And request { "name": "VuNguyen", "job": "QC"}
    When method post
    Then status 201

  # Post with response assertion
  Scenario: Post demo 33
    Given path '/users'
    And request { "name": "VuNguyen", "job": "QC"}
    When method post
    Then status 201
    And match response == {"name": "VuNguyen", "job": "QC","id": "#string","createdAt": "#ignore"}


 # Post with response matching from file
  Scenario: Post demo 4
    Given path '/users'
    And request { "name": "VuNguyen", "job": "QC"}
    When method post
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput

  # Read body data from file
  Scenario: Post demo 5
    Given path '/users'
    And def requestBody = read('data_post.json')
    And request requestBody
    When method post
    Then status 201


# Read body data from file and change request values
  Scenario: Post demo 7
    Given path '/users'
    And def requestBody = read('data_post.json')
    And request requestBody
    And set requestBody.job = 'QC'
    When method post
    Then status 201
