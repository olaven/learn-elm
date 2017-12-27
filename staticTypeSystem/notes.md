# notes for Static Type System

"Hello, World!" - String
'A' - Char
21 - Number


__Lists__ in elm must have _same datatype_

[1,43,12] - List number
["This", "These"] - List String


__Tuples__ in elm are lists with multiple datatypes

("I am a String", 30, "<- that was a number")
(1,23,4,12)


__Records__ are _like objects_ in JavaScript

{name = "olaven", "age" = 19}
{name = "Elon", "age" = 2}

Like other stuff in elm, they are immutable, meaning they can not be changed. One can, however create a new record by updating like this:

user0 = {name = "olaven", age = 19}
olderUser0 = {user0 | age = 33}

One can also use the record names as functions:

".name user0" will return "olaven"

You can not request fields that do not exist in Records. Wanting to access ".name" in user0 for example, means that .name has to be in user0. Otherwise, this will result in a compile error. In contrast, JavaScript would return undefined. __Null or undefined__ do not exist in Elm.


__Union Types__ are enumerations/lists of possible values.

type SomeType = possibleValue1 | possibleValue2 | possibleValue3

for example:
type Action = AddPlayer | Score
-- AddPlayer or Score are different values that Action can have.

action = AddPlayer
-- AddPlayer : Repl.Action -> action is of type Action

New version with parameters

type Action = AddPlayer String | Score Int Int

action AddPlayer "James"

_Pattern Matching_ Check case of type

ex.

type Msg = Msg1 Int | Msg2 String
msg = Msg2 "James"
case msg of
  Msg1 num ->
    -- something is of first Msg-type
  Msg2 name ->
    -- something else
-- Pattern matching must be complete; I have to write a check for every possible value of the type.


__Maybe__ is a _union type_ that can have to possible values: Just a | Nothing

first = List.head[]
-- Nothing : Maybe.Maybe a
case first of
  Just val -> val
  Nothing -> "Empty"

Like checking for null, but enforced by language, so one can't forget it.


__Result__ is also a union type. Result is the result of a computation that could fail.

import Date
-- valid date, but is something that could easily be wrong
someDate = Date.fromString "01/12/2017"
-- checking with Result type
case someDate of
  Ok val -> "It was a legit date"
  Err err -> err

-- the pattern matching is automatically linked to the Union Type
