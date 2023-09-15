Feature: Generate random data using java faker library

  Scenario: create simple json object - data faker
    * def dataFaker = Java.type("net.datafaker.Faker")
    * def dataFakerObject = new dataFaker()
    * def idValue = dataFakerObject.number().digits(5)
    * def nameValue = dataFakerObject.name().fullName()
    * set jsonObjectPayload
      | path | value     |
      | id   | idValue   |
      | name | nameValue |
    * print jsonObjectPayload

  Scenario: create simple json object - data faker without defining in the scenario(not recommended)
    * def dataFaker = Java.type("net.datafaker.Faker")
    * def dataFakerObject = new dataFaker()
    * set jsonObjectPayload
      | path | value                              |
      | id   | dataFakerObject.number().digits(5) |
      | name | dataFakerObject.name().fullName()  |
    * print jsonObjectPayload

  Scenario: create simple json object - data faker - with custom class from utils- recommended
    * def dataFaker = Java.type("examples.users.airline.utils.RandomDataGenerator")
    * def idValue = dataFaker.getRandomInteger(6)
    * def nameValue = dataFaker.getRandomFullName()
    * set jsonObjectPayload
      | path | value     |
      | id   | idValue   |
      | name | nameValue |
    * print jsonObjectPayload