import Html exposing (Html, text, beginnerProgram, div, h1, h2, button, nav, ul, li, p)
import Html.Attributes exposing (id)
import Html.Events exposing (onClick)

main : Program Never Model Msg
main = 
    beginnerProgram {
        model = model, 
        update = update, 
        view = view
    }

--model 
type Page = Home | About | Projects | Contact
type alias Model = 
    {
        header : String, 
        page : Page,
        skills : List String,
        projects : List String, 
        about : String, 
        contacts : List String 
    }

model : Model 
model = 
    { 
        header = "Welcome!", 
        page = Home, 
        skills = ["X", "Y", "Z"], 
        projects = ["A", "B", "C", "D"],
        about = "I am a xyz", 
        contacts = ["me@mail.com", "@handle"]
    }

--update 
type Msg = Change Page 

update : Msg -> Model -> Model 
update msg model = 
    case msg of Change page ->
        {model | page = page}

--view 
view : Model -> Html Msg 
view model = 
    div[][
        div[id "header"][
            h1[][text model.header], 
            nav[][
                button[onClick (Change Home)][text "Home"],
                button[onClick (Change About)][text "About"],
                button[onClick (Change Projects)][text "Projects"],
                button[onClick (Change Contact)][text "Contact"]
            ]
        ],
        div[id "home"][
            (renderPage model.page)
        ]
    ]


--rendering the page based on selection 
renderPage : Page -> Html Msg 
renderPage page = 
    case page of 
        Home -> 
            div[][text "home"]
        About -> 
            div[][
                p[][text model.about], 
                h2[][text "Skills"],
                ul[](List.map toLi model.skills)
            ]
        Projects -> 
            div[](List.map toLi model.projects)
        Contact -> 
            div[][
                ul[](List.map toLi model.contacts)
            ]

--turning string to li-element 
toLi : String -> Html Msg 
toLi string = 
    li[][text string]