Feature: Reusable function
@getRequest2
  Scenario: verify current weather data reusability
  Given url 'http://api.openweathermap.org/data/2.5/weather?q=London&appid=3c322ae59a7b42f9559ae5ef9c1d9ef9'
  When method get
  Then status 200
  And def des = response.weather[0].description