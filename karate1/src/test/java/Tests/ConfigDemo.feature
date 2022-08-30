Feature: config

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  Scenario: config demo
    Given print name

  Scenario: simple get
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
