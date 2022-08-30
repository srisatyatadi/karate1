Feature: testing POST api

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response.json')
    * def requestBody = read('request.json')

  Scenario: simple post api
    Given url 'https://reqres.in/api/users'
    And request {"name": "sri","job": "test"}
    When method POST
    Then status 201
    And print response

  Scenario: post with background
    Given path '/users'
    And request {"name": "sri","job": "test"}
    When method POST
    Then status 201
    And print response

  Scenario: post with response assertions
    Given path '/users'
    And request {"name": "sri","job": "test"}
    When method POST
    Then status 201
    And print response
    And match response == {"name": "sri","job": "test","id": "#string","createdAt": "#ignore"}
    And print response

  Scenario: post with
    Given path '/users'
    And request {"name": "sri","job": "test"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    
 Scenario: post read body data from file
    Given path '/users'
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput    

Scenario: post read body data from relative path
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And def filePath = projectPath +'/karate1/src/test/java/data/request1.json'  
    And request requestBody = filePath
    When method POST
    Then status 201
    #And match response == expectedOutput
    #And match $ == expectedOutput

    
Scenario: post read body data from file and change request value
    Given path '/users'
    And def requestBody = read('request.json')
    And request requestBody
    And set requestBody.job = 'engineer'
    When method POST
    Then status 201
    And print response    