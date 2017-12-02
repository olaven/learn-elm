module Main exposing (..)
import Html
import String

-- composition -> combine two functions


wordCount = String.words >> List.length

main =
  "These words are vital" |> wordCount |> toString |> Html.text
  -- send this as arg |> to this 
