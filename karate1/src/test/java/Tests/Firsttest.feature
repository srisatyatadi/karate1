Feature: Sample API tests

  Scenario: Test a sample get API
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
