module Counter exposing (Model, Msg, init, main, update, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)



-- MODEL


type alias Model =
    { count : Int
    }


init : Model
init =
    Model 0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ style "display" "flex"
        , style "justify-content" "space-around"
        , style "align-items" "center"
        , style "min-height" "100vh"
        , style "padding" "0 45vw"
        ]
        [ button [ onClick Decrement ] [ text "-" ]
        , div [ style "font-size" "30px" ] [ text (String.fromInt model.count) ]
        , button [ onClick Increment ] [ text "+" ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }
