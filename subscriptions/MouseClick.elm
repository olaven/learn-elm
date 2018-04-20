import Html exposing (Html, program, text, div, h1)
import Mouse exposing (Position, clicks)

main = 
    program {
        init = init, 
        update = update, 
        view = view, 
        subscriptions = subscriptions
    }

-- model 

type alias Model = {
    position : Position
}

model : Model 
model = {
        position = {x = 0, y = 0}
    }
    
init: (Model, Cmd Msg) 
init = (model, Cmd.none)

-- update 
type Msg = ChangePosition Position-- placeholder 

update : Msg -> Model -> (Model, Cmd Msg) 
update msg model = 
    case msg of 
        ChangePosition position -> 
            ({model | position = position}, Cmd.none)

-- view 
view : Model -> Html Msg    
view model = 
    div[][
        h1[][text "Mouse Position"], 
        (text (positionAsString model.position))
    ]

-- subscriptions 
subscriptions : Model -> Sub Msg 
subscriptions model = 
    clicks ChangePosition


positionAsString : Position -> String 
positionAsString position = 
    ((toString position.x) ++ " - " ++ (toString position.y))
