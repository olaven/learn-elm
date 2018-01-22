import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toInt)

main =
  beginnerProgram {
    model = model,
    update = update,
    view = view
  }

-- model
type alias Model = {
    counter : Int
  }

model : Model
model = {
    counter = 0, --initial
  }


-- update
type Msg = Increment | Decrement | Reset | Custom String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      {model |
        counter = model.counter + 1}
    Decrement ->
      {model |
        counter = model.counter - 1}
    Reset ->
      {model |
        counter = 0}
    Custom string -> -- custom value entered
      {model |
        counter = stringInt string}


-- view
view : Model -> Html Msg
view model =
  div[][
    h1[][text "counter"],
    div[][text (toString model.counter)], -- field for output
    div[id "button-container"][
      button[type_ "button", onClick Increment][text "+"],
      button[type_ "button", onClick Decrement][text "-"],
      br[][],
      button[type_ "button", onClick Reset][text "reset"],
      br[][],
      input[type_ "number", placeholder "custom value", onInput Custom][]
    ]
  ]


-- help functions

-- toInt may fail in parsing. It does therefore not return an Int, and this check is required
stringInt : String -> Int
stringInt string =
  case (toInt string) of
    Err msg ->
      0
    Ok val ->
      val
