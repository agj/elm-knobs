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
    -- Put the knob in the model:
    { knob : Knob Int }


type
    Msg
    -- Create a message for knob updates:
    = KnobUpdated (Knob Int)


init =
    -- Initialize the knob:
    { knob =
        Knob.int
            { step = 1
            , initial = 0
            }
    }


update msg model =
    case msg of
        -- Update the knob state:
        KnobUpdated knobState ->
            { knob = knobState }


view model =
    Html.div []
        -- Use the knob value within the view:
        [ Html.text (String.fromInt (Knob.value model.knob))

        -- Display the knob controls:
        , Knob.view KnobUpdated model.knob
        , Knob.styles
        ]
