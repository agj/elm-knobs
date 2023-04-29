module BasicExample exposing (main)

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
    { knob : Knob Int }


type Msg
    = KnobUpdated (Knob Int)


init =
    { knob = Knob.int { step = 1, initial = 0 } }


update msg model =
    case msg of
        KnobUpdated knobState ->
            { knob = knobState }


view model =
    Html.div []
        [ Html.text (String.fromInt (Knob.value model.knob))
        , Knob.view KnobUpdated model.knob
        , Knob.styles
        ]
