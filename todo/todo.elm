module Main exposing (..)

import Html exposing (Html, beginnerProgram, text, div, button, input, ul, li, input, h1)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (id, placeholder)
import List exposing (append, map, filter)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }



-- model


type alias Model =
    { todos : List String
    , placeholder : String
    , header : String
    , currentInput : String
    }


model : Model
model =
    { header = "Todo List"
    , placeholder = "todo name"
    , todos = []
    , currentInput = ""
    }



-- update


type Msg
    = Add 
    | Remove 
    | UpdateInput String 


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add ->
            { model | todos = (append model.todos [ model.currentInput ]) }

        Remove ->
            { model | todos = (filter (\todo -> not (todo == model.currentInput)) model.todos) }
        UpdateInput string -> 
            {model | currentInput = string}



-- view


view : Model -> Html Msg
view model =
    div []
        [ h1 [ id "todoHeader" ] [ text model.header ]
        , div []
            [ button [ onClick Add ] [ text "Add" ]
            , button [ onClick Remove ] [ text "Remove" ]
            ]
        , input [ onInput UpdateInput, placeholder model.placeholder ] []
        , ul [] (map toLi model.todos)
        ]


toLi : String -> Html msg
toLi string =
    li [] [ text string ]
