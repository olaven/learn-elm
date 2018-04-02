import Html exposing (Html, div, p, button, text)
import Html.Events exposing (onClick)


-- connecting the model, update and view together
main =
    Html.beginnerProgram { model = model, view = view, update = update }


--model 
type alias Model = {
    username : String, 
    password : String, 
    authenticated : Bool  
}

model : Model 
model = {username = "", password = "", authenticated = False}

--update 

type Msg = Username String | Password String | Authenticate 

update : Msg -> Model -> Model 
update msg model =
    case msg of 
        Username username -> 
            {model | username = username} 
        Password password -> 
            {model | password = password}
        Authenticate -> 
            {model | authenticated = (authorize model.username model.password)}

--view 

view : Model -> Html Msg 
view model =
    div[][
        div[][
            p[][text (toString "Username: " ++ model.username)], 
            p[][text (toString "Password: " ++ model.password)], 
            p[][text (toString "Authenticated: " ++ (toString model.authenticated))]
        ],  
        button[onClick (Username "Olav")][text "Give username"], 
        button[onClick (Password "pass")][text "Give password"], 
        button[onClick Authenticate][text "login"]
    ]

authorize : String -> String -> Bool 
authorize username password = 
    if username == "Olav" && password == "pass" then 
        True 
    else 
        False 


