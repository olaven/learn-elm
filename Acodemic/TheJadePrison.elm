import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Dict exposing (Dict)

main : Program Never Model Msg
main =
  program {
    init = init,
    view = view,
    update = update,
    subscriptions = (\_ -> Sub.none)
  }

-- model

type alias Model = {
    playerInformation : Dict String String
  }

type alias PlayerInformation =
  Dict String (Maybe String)

emptyPlayerInfo : PlayerInformation
emptyPlayerInfo = Dict.fromList [
    ("name", Nothing),
    ("player", Nothing),
    ("caste", Nothing),
    ("concept", Nothing),
    ("anima", Nothing),
    ("supernatural", Nothing)
  ]

-- init

model : Model 
model = {
    playerInformation = emptyPlayerInfo
  }

init : (Model, Cmd Msg)
init = (model, Cmd.none)


-- Msg
type Msg = EditPlayerInformation String String
-- update
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    EditPlayerInformation section value ->
      let
        newPlayerInfo =
          Dict.insert section (Just value) model.playerInformation
      in
        {model | playerInformation = newPlayerInfo} ! []


-- view
view : Model -> Html Msg
view model =
  div[][
    input[placeholder "name", onInput (EditPlayerInformation "name")][],
    input[placeholder "player", onInput (EditPlayerInformation "player")][]--,
    -- createSelect EditPlayerInformation "caste" castes
  ]

-- creates a select with options based on list of strings
createSelect : (String -> Msg) -> List String -> Html Msg
createSelect msg list =
  select[onInput msg]
    (List.map (\ s -> option[value s][text s]) list)


-- possible castes
castes : List String
castes = [
    "Dawn", "Zenith",
    "Twilight", "Night",
    "Eclipse"
  ]
