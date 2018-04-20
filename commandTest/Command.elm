import Html exposing (..)
import Mouse
import Random

main =
  program {
    init = init,
    update = update,
    view = view,
    subscriptions = subscriptions
  }

-- model
type alias Model = {
  text : String,
  mouseX : Int,
  mouseY : Int
}

init : (Model, Cmd Msg)
init = ({
  text = "init",
  mouseX = 0,
  mouseY = 0
 }, Cmd.none)

-- update
type Msg = MouseMsg Mouse.Position | CommandMsg Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MouseMsg position ->
      ({model |
        mouseX = position.x,
        mouseY = position.y}, Random.generate CommandMsg (Random.int 1 20))
    CommandMsg int ->
      ({model |
        text = toString int}, Cmd.none)

-- view
view : Model -> Html Msg
view model =
  div[][
    h1[][text "Command test"],
    div[][
      text (mousePosText "X" model.mouseX),
      br[][],
      text (mousePosText "Y" model.mouseY)
    ],
    div[][text model.text]
  ]


--subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch [
    Mouse.clicks MouseMsg
  ]


-- help functions

--ex. "X : 200"
mousePosText : String -> Int -> String
mousePosText string int =
  string ++ ": " ++ (toString int)
