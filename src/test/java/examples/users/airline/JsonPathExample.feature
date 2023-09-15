Feature: Jsonpath concepts in details

  Scenario: Basics Jsonpath examples- extracting values from request payload in different ways
    * def jsonObject =
    """
    {
    "store": {
        "book": [
            {
                "category": "reference",
                "author": "Nigel Rees",
                "title": "Sayings of the Century",
                "price": 8.95
            },
            {
                "category": "fiction",
                "author": "Evelyn Waugh",
                "title": "Sword of Honour",
                "price": 12.99
            },
            {
                "category": "fiction",
                "author": "Herman Melville",
                "title": "Moby Dick",
                "isbn": "0-553-21311-3",
                "price": 8.99
            },
            {
                "category": "fiction",
                "author": "J. R. R. Tolkien",
                "title": "The Lord of the Rings",
                "isbn": "0-395-19395-8",
                "price": 22.99
            }
        ],
        "bicycle": {
            "color": "red",
            "price": 19.95
        }
    },
    "expensive": 10,
    "title": "New title"
}
    """
#    * match jsonObject.expensive == 10
#    * def expensiveVal = get jsonObject.expensive
#    * print "expensive value", expensiveVal
#    * match expensiveVal == 10
#    * def expensiveVal = get jsonObject $.expensive
#    * print "expensive value", expensiveVal
#    * match expensiveVal == 10
#    * def expensiveVal = $jsonObject.expensive
#    * print "expensive value", expensiveVal
#    * match expensiveVal == 10
#    * def expensiveVal = karate.get('$jsonObject.expensive')
#    * print "expensive value", expensiveVal
#    * match expensiveVal == 10
#    * def expensiveVal = karate.jsonPath(jsonObject,'$.expensive')
#    * print "expensive value", expensiveVal
#    * match expensiveVal == 10
#    it will print the first book title in store array
    * print karate.jsonPath(jsonObject,'$.store.book[1].title')
    #    it will print all book titles in store array
    * print karate.get('$jsonObject.store.book[*].title')
    * print (karate.get('$jsonObject.store.book[*].title'))[3]
#    another way to print all titles
    * def val1 = karate.jsonPath(jsonObject,'$..title')
    * print val1
#    printing all titles except the last one which means we will print all titles inside book array
    * def val2 = karate.jsonPath(jsonObject,'$..book..title')
    * print val2
#    filtering titles based on author name
    * print karate.jsonPath(jsonObject,"$.store.book[?(@.author == 'Nigel Rees')].title")
#    using jsonpath with logical operators - and operator
    * print karate.jsonPath(jsonObject,"$.store.book[?(@.author == 'Nigel Rees' && @.author == 'Evelyn Waugh')].title")
    #    using jsonpath with logical operators - or operator
    * print karate.jsonPath(jsonObject,"$.store.book[?(@.author == 'Nigel Rees' || @.author == 'Evelyn Waugh')].title")
#    getting the first book in the given json object
    * print karate.jsonPath(jsonObject,"$.store.book[0]")
#    getting the book before the last one in the given json object
    * print karate.jsonPath(jsonObject,"$.store.book[-2]")
    # getting the first two books in the given json object
    * print karate.jsonPath(jsonObject,"$.store.book[0,1]")
    # getting the first three books in the given json object
    * print karate.jsonPath(jsonObject,"$.store.book[0:3]")
#    printing how many children of book array has which means the size of array
    * print karate.jsonPath(jsonObject,"$.store.book.length()")
#    printing the sum of the prices of all books
    * print karate.jsonPath(jsonObject,"$..price.sum()")
    #    printing max price of all books
    * print karate.jsonPath(jsonObject,"$..price.max()")
    #    printing min price of all books
    * print karate.jsonPath(jsonObject,"$..price.min()")






