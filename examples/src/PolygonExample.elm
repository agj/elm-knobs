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
    { controls : Knob Controls }


type alias Controls =
    { sides : Int
    , size : Int
    , hue : Float
    , saturation : Float
    , luminance : Float
    }


type Msg
    = ControlsKnobUpdated (Knob Controls)


init =
    { controls =
        Knob.compose Controls
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
    }


update msg model =
    case msg of
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
        [ viewPolygon (Knob.value model.controls)
        , Knob.view ControlsKnobUpdated model.controls
        , Knob.styles
        ]


viewPolygon : Controls -> Html Msg
viewPolygon { sides, size, hue, saturation, luminance } =
    let
        polygonPoints =
            List.range 0 (sides - 1)
                |> List.map (polygonPoint sides size)

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


polygonPoint : Int -> Int -> Int -> ( Float, Float )
polygonPoint sides size pointIndex =
    ( toFloat size
    , (2 * pi / toFloat sides * toFloat pointIndex) - (pi / 2)
    )
        |> fromPolar
