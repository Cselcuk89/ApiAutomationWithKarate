Feature: in this file, we will learn small but important concepts of karate framework

  Scenario: Embedded expressions in karate framework
    * def employee = {fName: 'Bobby', lName:'Boo'}
    * print employee
    * def employee1 = {fName:'#(fnameVal)',lName:'#(lnameVal)',id:'#(idVal)',isManager:'#(isManager)'}
    * print employee1
    * def employee2 = {fullName:'#(fnameVal + " " +  lnameVal)',id:'#(idVal)',isManager:'#(isManager)'}
    * print employee2
    * def employee3 = {fullName:'#("Hello " + fnameVal + " " +  lnameVal)',id:'#(idVal)',isManager:'#(isManager)'}
    * print employee3
    * def employeePayload = read('payloads/Employee.json')
    * print employeePayload
    * def welcomeText = `Hello ${fnameVal}`
    * print welcomeText
    * def fullName = "Cagri Selcuk"
    * match fullName == fnameVal + " " + lnameVal
    * match fullName == '#(fnameVal + " " + lnameVal)'

  Scenario: Embedded expressions in karate framework - part 2 - embedding jsonpath
#    if you put double hash sign before the variable name in embedded expressions, it will ignore it in response even if it is declared as null
    * def employee = {fName: 'Bobby', lName:'Boo'}
    * print employee
    * def fnameVal = 'Cagri'
    * def lnameVal = 'Selcuk'
    * def idVal = 100
    * def isManager = false
    * def employee1 = {fName:'#(employee.fName)',lName:'#(employee.lName)',id:'#(idVal)',isManager:'#(isManager)'}
    * print employee1
  Scenario: Embedded expressions in karate framework - part 3 - embedding jsonpath
#    if you put double hash sign before the variable name in embedded expressions, it will ignore it in response even if it is declared as null
    * def employee = {fName: 'Bobby', lName:'Boo'}
    * print employee
    * def fnameVal = 'Cagri'
    * def lnameVal = 'Selcuk'
    * def idVal = null
    * def isManager = false
    * def employee1 = {fName:'#(employee.fName)',lName:'#(employee.lName)',id:'##(idVal)',isManager:'#(isManager)'}
    * print employee1


