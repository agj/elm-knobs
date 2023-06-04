module PolygonExample exposing (main)

import Browser
import Color
import Html exposing (Html)
import Html.Attributes exposing (style)
import Knob exposing (Knob)
import TypedSvg as Svg
import TypedSvg.Attributes as SvgAttr
import TypedSvg.Types exposing (Paint(..), px)


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    -- We put the knob in the model.
    -- Notice that there's only one value, despite having multiple controls.
    -- All of the individual values are held in a single record.
    { controls : Knob Controls }


type alias Controls =
    -- This is the record type that we're using to hold the values.
    { show : Bool
    , sides : Int
    , size : Int
    , hue : Float
    , saturation : Float
    , luminance : Float
    , sitOn : SitOn
    }


type
    Msg
    -- This is the message that will be emitted upon user interaction.
    = ControlsKnobUpdated (Knob Controls)


init =
    { controls =
        -- Here we initialize our knob.
        -- We use `compose` to join multiple knobs into one.
        Knob.compose Controls
            -- Below we use `stackLabel` to add controls one by one,
            -- assigning a label that will be visible to the user.
            -- Each stacked knob maps to one field in the `Controls` record,
            -- and order here must match the order in the record definition.
            |> Knob.stackLabel "Show"
                (Knob.boolCheckbox True)
            |> Knob.stackLabel "Sides"
                (Knob.intConstrained
                    { range = ( 3, 100 )
                    , step = 1
                    , initial = 5
                    }
                )
            |> Knob.stackLabel "Size"
                (Knob.intSlider
                    { range = ( 10, 250 )
                    , step = 1
                    , initial = 100
                    }
                )
            |> Knob.stackLabel "Color hue"
                (Knob.floatSlider
                    { range = ( 0, 1 )
                    , step = 0.01
                    , initial = 0.9
                    }
                )
            |> Knob.stackLabel "Color saturation"
                (Knob.floatSlider
                    { range = ( 0, 1 )
                    , step = 0.01
                    , initial = 0.9
                    }
                )
            |> Knob.stackLabel "Color luminance"
                (Knob.floatSlider
                    { range = ( 0, 1 )
                    , step = 0.01
                    , initial = 0.5
                    }
                )
            |> Knob.stackLabel "Sit on"
                (Knob.select
                    { options = [ "Vertex", "Edge" ]
                    , toString = sitOnToString
                    , fromString = sitOnFromString
                    , initial = SitOnVertex
                    }
                )
    }


type SitOn
    = SitOnEdge
    | SitOnVertex


sitOnFromString : String -> SitOn
sitOnFromString string =
    case string of
        "Edge" ->
            SitOnEdge

        _ ->
            SitOnVertex


sitOnToString : SitOn -> String
sitOnToString sitOn =
    case sitOn of
        SitOnEdge ->
            "Edge"

        SitOnVertex ->
            "Vertex"


update msg model =
    case msg of
        -- We update the knob in the model.
        ControlsKnobUpdated knobState ->
            { controls = knobState }


view model =
    Html.div
        [ style "display" "flex"
        , style "align-items" "center"
        , style "justify-content" "center"
        , style "height" "100vh"
        , style "width" "100vw"
        ]
        -- In our view we use `value` to extract the current value of the knob,
        -- and use that data to construct the polygon.
        [ viewPolygon (Knob.value model.controls)

        -- We display the knobs panel using `view` and `styles`.
        , Knob.view ControlsKnobUpdated model.controls
        , Knob.styles
        ]


viewPolygon : Controls -> Html Msg
viewPolygon { show, sides, size, hue, saturation, luminance, sitOn } =
    if not show then
        Html.text ""

    else
        let
            polygonPoints =
                List.range 0 (sides - 1)
                    |> List.map (polygonPoint sitOn sides size)

            color =
                Color.hsl hue saturation luminance
        in
        Svg.svg
            [ SvgAttr.width (px 500)
            , SvgAttr.height (px 500)
            , SvgAttr.viewBox -250 -250 500 500
            ]
            [ Svg.polygon
                [ SvgAttr.points polygonPoints
                , SvgAttr.fill (Paint color)
                ]
                []
            ]


polygonPoint : SitOn -> Int -> Int -> Int -> ( Float, Float )
polygonPoint sitOn sides size pointIndex =
    let
        angleOffset =
            case sitOn of
                SitOnEdge ->
                    0

                SitOnVertex ->
                    pi / toFloat sides
    in
    ( toFloat size
    , (2 * pi / toFloat sides * toFloat pointIndex) + (pi / 2) + angleOffset
    )
        |> fromPolar
