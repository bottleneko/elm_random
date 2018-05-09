import Html exposing (Html, Attribute, div, h1, button)
import Html.Events exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Random exposing (..)

main =
    Html.program
        {   init = init
        ,   view = view
        ,   update = update
        ,   subscriptions = subscriptions
        }

-- MODEL

type alias Model =
    { diceFace : Int }

init : (Model, Cmd Msg)
init = (Model 1, Cmd.none)

type Msg = Roll | NewFace Int

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Roll ->
            (model, Random.generate NewFace (Random.int 1 6))
        NewFace newFace ->
            (Model newFace, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ diceSvg model
        , button [ onClick Roll ] [ text "Roll" ]
        ]

diceSvg : Model -> Svg Msg
diceSvg model =
    svg [ width "120"
        , height "120"
        , viewBox "0 0 120 120"
        ]
        (dicePoints (model.diceFace))

dicePoints : Int -> List (Svg Msg)
dicePoints points =
    case points of
        1 ->
            [ circle
                [ cx "60"
                , cy "60"
                , r "10"
                ]
                []
            ]
        2 ->
            [ circle
                [ cx "90"
                , cy "30"
                , r "10"
                ]
                []
            , circle
                [ cx "30"
                , cy "90"
                , r "10"
                ]
                []
            ]
        3 ->
            [ circle
                [ cx "90"
                , cy "30"
                , r "10"
                ]
                []
            ,   circle
                [ cx "60"
                , cy "60"
                , r "10"
                ]
                []
            ,   circle
                [ cx "30"
                , cy "90"
                , r "10"
                ]
                []
            ]
        4 ->
            [ circle
                [ cx "40"
                , cy "40"
                , r "10"
                ]
                []
            ,   circle
                [ cx "80"
                , cy "80"
                , r "10"
                ]
                []
            ,   circle
                [ cx "40"
                , cy "80"
                , r "10"
                ]
                []
            ,   circle
                [ cx "80"
                , cy "40"
                , r "10"
                ]
                []
            ]
        5 ->
            [ circle
                [ cx "40"
                , cy "40"
                , r "10"
                ]
                []
            ,   circle
                [ cx "80"
                , cy "80"
                , r "10"
                ]
                []
            ,   circle
                [ cx "40"
                , cy "80"
                , r "10"
                ]
                []
            ,   circle
                [ cx "80"
                , cy "40"
                , r "10"
                ]
                []
            ,   circle
                [ cx "60"
                , cy "60"
                , r "10"
                ]
                []
            ]
        6 ->
            [ circle
                [ cx "40"
                , cy "90"
                , r "10"
                ]
                []
            , circle
                [ cx "80"
                , cy "90"
                , r "10"
                ]
                []
            , circle
                [ cx "40"
                , cy "60"
                , r "10"
                ]
                []
            , circle
                [ cx "80"
                , cy "60"
                , r "10"
                ]
                []
            , circle
                [ cx "40"
                , cy "30"
                , r "10"
                ]
                []
            , circle
                [ cx "80"
                , cy "30"
                , r "10"
                ]
                []
            ]
        _ ->
            []
