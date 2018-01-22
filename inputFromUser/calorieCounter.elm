-- imports
import Html exposing (..)

-- main
main =
  Html.beginnerProgram {model = model, update = update, view = view}


-- model
type alias Model =
  {
    count : Int,
    input : String
  }
model : Model
-- initial model
model  = {count = 0, value = ""}

-- update
type Msg = Clear | Add | Set

update : Model -> Msg -> Model
update model msg =
  {count = 1, input = "input"}

-- view
view : Model -> Html Msg
view model =
  div[][text (toString model)]
