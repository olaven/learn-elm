module Main exposing (..)
import Html exposing (..)

upperIfLong name =
  if
    String.length name > 10 then
      String.toUpper name
  else
    name

main =
  text (upperIfLong "olavenolavenolaven")
