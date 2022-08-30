Feature: DELETE api
Scenario: simple delete api 
Given url 'https://reqres.in/api/users/2'
When method DELETE
Then status 204
And print response