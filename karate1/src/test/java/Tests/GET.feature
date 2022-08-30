Feature: get api demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: simple get
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  Scenario: get with back
    Given path '/users/2'
    When method GET
    Then status 200
    And print response

  Scenario: get with path,params
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  Scenario: get with assertions
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[1].first_name != null
    And assert response.data.length==6
    And match response.data[5].id == 12
    And match response.data[4].last_name == 'Edwards'
    
