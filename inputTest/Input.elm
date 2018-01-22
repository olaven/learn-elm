import Html exposing (..)
import Html.Events exposing (onInput, onClick)
import Html.Attributes exposing (type_, placeholder)
import String exposing (reverse)

main =
  beginnerProgram {
    model = model,
    update = update,
    view = view
  }

type alias Model = {
  text : String
}

model : Model
model = {
    text = "" -- initial
  }

type Msg = Add String | Clear

update : Msg -> Model -> Model
update msg model =
  case msg of
    Add string ->
      {text = string}
    Clear ->
      {text = ""} -- returning to initial

view : Model -> Html Msg
view model =
  div[][
    input[type_ "text", onInput Add, placeholder "enter text"][],
    div[][text model.text],
    button[onClick Clear][text "reset"]
  ]

-- help functions
