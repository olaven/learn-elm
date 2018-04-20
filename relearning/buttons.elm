import Html exposing (Html, beginnerProgram, text, div, input, label, p)
import Html.Attributes exposing (type_, style)
import Html.Events exposing (onClick)

main = 
    beginnerProgram{
        model = model, 
        update = update, 
        view = view
    }

-- init 
type alias Model = {size : Int}

model : Model 
model = {
        size = 0
    }

-- update 
type Msg = Small | Medium | Large

update : Msg -> Model -> Model 
update msg model = 
    case msg of 
        Small -> 
            {model | size = 20}
        Medium -> 
            {model | size = 40}
        Large -> 
            {model | size = 60}

-- view 
view : Model -> Html Msg
view model = 
    div[][
        div[][
            (radioAndLabel "Small" Small), 
            (radioAndLabel "Medium" Medium), 
            (radioAndLabel "Large" Large)
        ], 
        p[style [("font-size", (toString model.size ++ "px"))]][
            text "hei"
        ]
    ]

-- radio button with label 
radioAndLabel: String -> Msg -> Html Msg 
radioAndLabel desc msg = 
    label[][
        (text desc), 
        input[type_ "radio", onClick msg][]
    ]
    
