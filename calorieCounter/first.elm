module Main exposing(..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model
  -- holder data som app trenger
type alias Model =
  Int

initModel : Model
initModel =
  0

-- update
  -- oppdaterer state/model
type Msg = AddCalorie | Clear -- see line 20/23

update : Msg -> Model -> Model
update msg model =
  case msg of
    AddCalorie -> -- *
      model + 1
    Clear ->
      initModel


-- view
  -- what should be shown?

view : Model -> Html Msg
view model =
  div[][
    h3[][text ("Caloriecount: " ++ (toString model))],
    button[type_ "button", onClick AddCalorie][text "add"],
    button[type_ "button", onClick Clear][text "clear"]

  ]


-- connecting the model, update and view together
main : Program Never Model Msg
main =
  Html.beginnerProgram
    {
      model = initModel,
      update = update,
      view = view
    }
