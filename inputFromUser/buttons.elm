import Html exposing (text, input, h3, Html, button, div)
import Html.Attributes exposing (type_)
import Html.Events exposing (onClick)


-- main


main =
  Html.beginnerProgram
  {
    model = model,
    update = update,
    view = view
  }


-- model
type alias Model =
  Int

model : Model
model =
  0

-- update
type Msg = Increment | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1
    Decrement ->
      model - 1



-- view
view : Model -> Html Msg
view model =
  div[][
    h3[][text ("value: " ++ (toString model))],
    button[type_ "button", onClick Increment][text "Increment"],
    button[type_ "button", onClick Decrement][text "Decrement"]
  ]
