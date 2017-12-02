module Main exposing (..)
import Html

(~=) a b =
  a == b


result a b =
  a ~= b

main =
  Html.text (toString( result "Cow" "Wow" ))
