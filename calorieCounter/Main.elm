module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- structure of an elm app
  -- model
  -- update
  -- view

-- MODEL

-- Model is what we want to change
type alias Model =
  Int

-- initialization of the model -> used when connecting the "structure-parts"
initModel : Model
initModel =
  0

-- UPDATE

-- what is possible?
-- possible things ("arguments to this section")
type Msg =
  AddCalorie
  | Clear
update : Msg -> Model -> Model
update msg model =
  case msg of
    AddCalorie ->
      model + 1
    Clear ->
      initModel -- 0

-- VIEW
-- html that generates a message
view : Model -> Html Msg
view model =
  div []
      [
        h3[] [text ("Total Calories: " ++ (toString model))],
        button [type_ "button", onClick AddCalorie] [ text "Add"],
        button [type_ "button", onClick Clear] [ text "Clear"]
      ]


-- connecting the parts together
main : Program Never Model Msg
main =
  Html.beginnerProgram
    {
      model = initModel,
      update = update,
      view = view
    }
