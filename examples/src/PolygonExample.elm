module PolygonExample exposing (main)

import Browser
import Html
import Knob exposing (Knob)


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
    , hue : Float
    , saturation : Float
    , luminance : Float
    }


type Msg
    = ControlsKnobUpdated (Knob Controls)


init =
    { controls =
        Knob.compose Controls
            |> Knob.stackLabel "Sides" (Knob.int { step = 1, initial = 0 })
            |> Knob.stackLabel "Hue" (Knob.floatSlider { range = ( 0, 1 ), step = 0.01, initial = 0 })
            |> Knob.stackLabel "Saturation" (Knob.floatSlider { range = ( 0, 1 ), step = 0.01, initial = 0 })
            |> Knob.stackLabel "Luminance" (Knob.floatSlider { range = ( 0, 1 ), step = 0.01, initial = 0 })
    }


update msg model =
    case msg of
        ControlsKnobUpdated knobState ->
            { controls = knobState }


view model =
    let
        controls =
            Knob.value model.controls
    in
    Html.div []
        [ Html.text (String.fromInt controls.sides)
        , Knob.view ControlsKnobUpdated model.controls
        , Knob.styles
        ]
