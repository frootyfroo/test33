%dw 2.0
output application/json
// have create a variable that segrigates and gives on ly Id's into arry so that we can segrigate data by grouping based on id we get entire books details with id and book details//
var vandana = payload flatMap ((item) -> (
item.books map (b) -> {id: item.id,(b)}))
distinctBy ((item) -> item.bookid)
groupBy ((item) -> item.id)
---
// requirement is to transform the payload to required data. At the same time we need to removie doublicate key - values from objects each one has to iterate once//
keysOf(vandana) map ((item) ->
{
id: item,
books: vandana[item] map ((book) -> book - 'id')
} )