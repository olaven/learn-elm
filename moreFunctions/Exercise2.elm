module Main exposing (..)

import Html

(~=) a b =
  a == b

-- infix function as prefix function
result =
  -- prefix usage o
  (~=) 1 2
  -- infix usage:
  --1 ~= 2

main =
  Html.text (toString (1 add 2))
