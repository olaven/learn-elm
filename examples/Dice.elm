-- app that "rolls dice"
-- random int between 1 and 6

import Html exposing (..)
import Html.Events exposing (..)
import Random exposing (..)

main =
  program {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
  }

-- start with guessing the look of Model
type alias Model =
  {dieFace : Int}

-- specify  initial model and command to run when the app starts
init : (Model, Cmd Msg)
init =
  (Model 1, Cmd.none) --.none -> no command, placeholder

-- update
type Msg =
  Roll | NewFace Int

update : Msg -> Model -> (Model, Cmd Msg) -- produces both model and command
update msg model =
  case msg of
    Roll ->
       (model, Random.generate NewFace (Random.int 1 6)) --http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Random

    NewFace newFace ->
      (Model newFace, Cmd.none) -- step model forward, do nothing

-- subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- view
view : Model -> Html Msg
view model =
  div[][
    div[][text "hi"],
    h1 [][text (toString model.dieFace)],
    button [onClick Roll] [text "Roll"]
  ]
