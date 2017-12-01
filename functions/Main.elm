module Main exposing (..)
import Html

-- whitespace is vital to syntax
add a b = -- functionname, parameters
  a + b -- implicit return

--result =
--  add 1 2

result =
  -- (add 1 2) is sent as an argument to (add 3), resulting in (add 3(add 2 1))==6
  add 1 2 |> add 3

printvar var =
  var |> \ x -> "x: " ++ (toString x)



main =
  -- no implicit change of datatype, has to be explicit
  Html.text (printvar 3)


-- partial application
-- x |> y -- x is sent as an argument to y

-- anonymous function
-- \_ x + y-> x * y
