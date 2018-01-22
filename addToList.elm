--html
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
--user input
import Keyboard
import Mouse

main =
  program {
    init = init,
    update = update,
    subscriptions = subscriptions,
    view = view
  }


-- model
type alias Model = {
    toBeAdded : String,
    items : List String
  }

init : (Model, Cmd Msg)
init =
  ({ toBeAdded = "",
  items = []}, Cmd.none)

-- update
type Msg = KeyMsg Keyboard.KeyCode | Input String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
      -- next string to be added is registered
      Input string ->
        ({model |
          toBeAdded = string}, Cmd.none)
      -- the new string is, on enter, actually added
      KeyMsg code ->
        if code == 13 then
          ({model |
            items = (model.toBeAdded :: model.items)}, Cmd.none)
        else
          (model, Cmd.none) -- if not enter, keep things the same



-- view
view : Model -> Html Msg
view model =
    div[id "container"][
        h1[][text "Enter items to list"],
        div[id "input-container"][
            input[type_ "text", placeholder "enter to add", value model.toBeAdded, onInput Input][]
        ],
        div[id "output-container"][
          renderList model.items
        ]
    ]


--subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch [
    Keyboard.downs KeyMsg
  ]



-- help functions


--renders a html-list based on a List String
renderList : List String -> Html Msg
renderList list =
    ul []
        (List.map toLi list)
--returns a html-li with string-arg as text
toLi : String -> Html Msg
toLi string =
  li[][text string]
