Feature: get airline data
  Scenario: get airline data using ID
    Given url 'https://api.instantwebtools.net/v1/airlines/13'
    When method get
    Then status 200

  Scenario: get airline data using ID - basic assertions
    Given url 'https://api.instantwebtools.net'
    And path "/v1/airlines/13"
    And header X-Request-id = "Test123"
    When method get
    Then status 200
    And match responseStatus == 200
    And print 'response status code is as below - ' + responseStatus
    And match response == {"id":13,"name":"Sri Lankan Airways","country":"Sri Lanka","logo":"https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png","slogan":"From Sri Lanka","head_quaters":"Katunayake, Sri Lanka","website":"www.srilankaairways.com","established":"1990"}
    And match $ == {"id":13,"name":"Sri Lankan Airways","country":"Sri Lanka","logo":"https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png","slogan":"From Sri Lanka","head_quaters":"Katunayake, Sri Lanka","website":"www.srilankaairways.com","established":"1990"}
    And match response.name == "Sri Lankan Airways"
    And match $.name != "Sri Lankan Airway"
    And print responseHeaders["Content-Type"][0]
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Content-Type contains 'application/json'


