import Html exposing (..)
import Html.Attributes exposing (type_)
import Html.Events exposing (onClick, onInput)

-- main

main =
  Html.beginnerProgram {model = model, update = update, view = view}

-- model

type alias Model = {
  calories : Int,
  input : Int
}

model : Model
model = {
    calories = 0,
    input = 0
  }

-- update
type Msg = Add | Clear | Input String
update : Msg -> Model -> Model
update msg model =
  case msg of
    Add ->
      {model |
      calories = model.calories + input,
      input = 1 -- placeholder
    }
    Clear ->
      {model |
      calories = 0,
      input = 0
    }
    Input String ->
      {model |
      calories = String.toInt input
      }




-- view

view : Model -> Html Msg
view model =
  div[][
    h3[][text ("Count: " ++ toString model.calories)],
    input[type_ "number", onInput Input][],
    button[type_ "button", onClick Add][text "Add"],
    button[type_ "button", onClick Clear][text "Clear"]
  ]
