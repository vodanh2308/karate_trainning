Feature: Register User

  Background:
    * url 'https://api-nodejs-todolist.herokuapp.com'
    * header Content-Type = 'application/json'
    * def random = Math.random().toString(36).substring(7);
    * def projectPath = karate.properties['user.dir']
    * def JavaDemo = Java.type('supportingjson.jsonbody')

  Scenario: Register User 1
    Given url 'https://api-nodejs-todolist.herokuapp.com/user/register'
    And request {"name": "VuNguyen", "email": "VuNguyen12223@gmail.com", "password": "12345678", "age": 20 }
    When method POST
    Then status 201

  Scenario: Register User 2
    Given path '/user/register'
    And request {"name": "Vu Nguyen 13", "email": "VuNguyen13@gmail.com", "password": "12345678", "age": 20 }
    When method POST
    Then status 201
    And print response

  Scenario: Register User 3
    Given path '/user/register'
    And request {"name": "Vu Nguyen 16", "email": "VuNguyen16@gmail.com", "password": "12345678", "age": 20 }
    When method POST
    Then status 201
    And match response == {"user":{"age":20,"_id":"#ignore","name":"Vu Nguyen 16","email":"vunguyen16@gmail.com","createdAt":"#ignore","updatedAt":"#ignore","__v":1},"token":"#string"}
    And assert <string>

  Scenario: Register User 4
    Given path '/user/register'
    And def filePath = projectPath + '/src/test/java/Data/register_payload.json'
    And request filePath
    When method POST
    Then status 201

  Scenario: Register User 5
    Given url 'https://api-nodejs-todolist.herokuapp.com/user/register'
    And def payload =  {"name": '<username>', "email": "<email>, "password": "12345678", "age": 20 }
    And replace payload.username = random,payload.email = random
    And print payload
#    When method POST
#    Then status 201

  Scenario: Register User 6
    Given path '/user/register'
    And def payload = read('file:' + projectPath + '/src/test/java/Data/register_payload.json')
    And set payload.name = random
    And set payload.email = random + '@gmail.com'
    And print payload
    And request payload
    When method POST
    Then status 201
    And print response
    And match response.user.name == payload.name
    And match $.user.email == payload.email
    * string res = response
    * def SaveResponse = JavaDemo.writeInfor(res)
#    And def mx =
#    """
#      function(args) {
#       var DataStorage = Java.type('examples.DataStorage');
#       var dS = new DataStorage();
#       return dS.write(args);
#    """
#    And def x = call mx "x"
#    And print x