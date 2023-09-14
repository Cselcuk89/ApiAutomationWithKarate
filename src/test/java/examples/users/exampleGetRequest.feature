Feature: validate get request
  @getRequest1
  Scenario: verify current weather data
    Given url 'http://api.openweathermap.org/data/2.5/weather?q=London&appid=3c322ae59a7b42f9559ae5ef9c1d9ef9'
    When method get
    Then status 200
#    And match response.weather[0].description contains 'scattered clouds'
#    And match response.weather[0].description !contains 'few clouds'
    And match response.weather[0].description != '#number'
    And match response.weather[0].id == '#number'
  Scenario Outline: verify current weather data
    Given url '<url>'
    When method get
    Then status 200
    And def des = response.weather[0].description
    And print des
    Examples:
    |url|
    |http://api.openweathermap.org/data/2.5/weather?q=London&appid=3c322ae59a7b42f9559ae5ef9c1d9ef9|
  Scenario Outline: verify dummy sample rest api get request using "match each" keyword
    Given url '<url>'
    When method get
    Then status 200
    And print response
    Then match each response.data ==
    """
    {
	"id": "#number",
	"employee_name": "#string",
	"employee_salary": "#number",
	"employee_age": "#number",
	"profile_image": "##string"
	}
    """

    Examples:
      |url|
      |https://dummy.restapiexample.com/api/v1/employees|
  @getRequest2
    Scenario: verify username info from the response
      Given url 'https://gorest.co.in/public/v1/users'
      When method get
      Then status 200
      When def outputEmail = []
      When def outputGender = []
      And eval for(var i = 0;i<response.data.length;i++) if(response.data[i].name.endsWith("Dhrutika")) outputEmail.add(response.data[i].email),outputGender.add(response.data[i].gender)
      Then print outputEmail
      Then print outputGender





