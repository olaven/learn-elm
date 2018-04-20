module EventListener exposing (..)
import Html exposing (..)
import Keyboard

type alias Model = Int

init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )

type alias KeyCode = Int 
type Msg = KeyPressed Keyboard.KeyCode

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        KeyPressed _ -> -- "_" instead of "keyCode because we are ignoring it"
            ( model + 1, Cmd.none )

view: Model -> Html Msg 
view model = 
    div[][text (toString model)]


subscriptions : Model -> Sub Msg
subscriptions _ = -- "_" because model is not used 
    Keyboard.presses KeyPressed


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }