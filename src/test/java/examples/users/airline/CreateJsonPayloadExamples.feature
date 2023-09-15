Feature: Create nested complex json payloads in karate framework using set multiple

  Scenario: Create simple json object
    * set jsonObjectPayload
      | path | value              |
      | id   | 12                 |
      | name | "Cagri's airlines" |
    * print jsonObjectPayload

  Scenario: Create nested json object
    * set jsonObjectPayload
      | path                   | value              |
      | id                     | 12                 |
      | name                   | "Cagri's airlines" |
      | address.primary.street | "76 A"             |
      | address.primary.city   | "Jersey city"      |
    * print jsonObjectPayload

  Scenario: Create nested json object and json arrays
    * set jsonObjectPayload
      | path                        | value              |
      | id                          | 12                 |
      | name                        | "Cagri's airlines" |
      | address[0].primary.street   | "76 A"             |
      | address[0].primary.city     | "Jersey city"      |
      | address[1].secondary.street | "456 A"            |
      | address[1].secondary.city   | "Newyork city"     |
    * print jsonObjectPayload

  Scenario: Create simple json object with variables
    * def idValue = 12
    * def nameValue = "Cagri's airlines"
    * set jsonObjectPayload
      | path | value     |
      | id   | idValue   |
      | name | nameValue |
    * print jsonObjectPayload

  Scenario: Create simple json array object
    * set jsonObjectPayload
      | path | 0                  | 1                  |
      | id   | 12                 | 13                 |
      | name | "Cagri's airlines" | "Fatma's airlines" |
    * print jsonObjectPayload

  Scenario: Create simple json array object - empty
    * set jsonObjectPayload
      | path | 0                  | 1                  |
      | id   | 12                 |                    |
      | name | "Cagri's airlines" | "Fatma's airlines" |
    * print jsonObjectPayload

  Scenario: Create simple json array object - null
    * set jsonObjectPayload
      | path | 0                  | 1                  |
      | id   | 12                 | (null)             |
      | name | "Cagri's airlines" | "Fatma's airlines" |
    * print jsonObjectPayload

  Scenario: manipulating existing JSON
    * def existingJsonObject = { name : 'Cagri'}
    * set existingJsonObject
      | path | value              |
      | id   | 12                 |
      | name | "Cagri's airlines" |
    * print existingJsonObject

  Scenario: manipulating existing JSON - set with jsonpath
    * def existingJsonObject = { name : 'Cagri'}
    * set existingJsonObject.details
      | path | value              |
      | id   | 12                 |
      | name | "Cagri's airlines" |
    * print existingJsonObject

  Scenario: manipulating existing JSON - set with jsonpath
    * def existingJsonObject = { name : 'Cagri'}
    * set existingJsonObject.details
      | path | value              |
      | id   | 12                 |
      | name | "Cagri's airlines" |
    * print existingJsonObject