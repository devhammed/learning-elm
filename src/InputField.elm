module InputField exposing (Model, Msg, init, main, update, view)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (placeholder, style, value)
import Html.Events exposing (onInput)



-- MODEL


type alias Model =
    { content : String
    }


init : Model
init =
    { content = "" }



-- UPDATE


type Msg
    = InputChanged String


update : Msg -> Model -> Model
update msg model =
    case msg of
        InputChanged newContent ->
            { model | content = newContent }



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ style "display" "flex"
        , style "flex-direction" "column"
        , style "justify-content" "center"
        , style "align-items" "space-around"
        , style "min-height" "100vh"
        , style "padding" "0 45vw"
        ]
        [ input [ placeholder "Text to reverse", value model.content, onInput InputChanged ] []
        , div [ style "margin-top" "20px" ] [ text (String.reverse model.content) ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }
