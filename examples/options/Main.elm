module Main exposing (main)

import Browser
import Dict
import Html
import Knob exposing (Knob)
import Knob.Option


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    { knob : Knob Knob.Option.Option }


type Msg
    = KnobUpdated (Knob Knob.Option.Option)


init =
    { knob =
        Knob.label "Anchoring"
            (Knob.select
                { options =
                    [ ( "none", Knob.Option.detached )
                    , ( "top-left", Knob.Option.anchorTopLeft )
                    , ( "top-right", Knob.Option.anchorTopRight )
                    , ( "bottom-left", Knob.Option.anchorBottomLeft )
                    , ( "bottom-right", Knob.Option.anchorBottomRight )
                    ]
                , initial = Knob.Option.detached
                }
            )
    }


update msg model =
    case msg of
        KnobUpdated knobState ->
            { knob = knobState }


view model =
    Html.div []
        [ Knob.view [ Knob.value model.knob ] KnobUpdated model.knob
        , Knob.styles
        ]
