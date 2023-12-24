port module Main exposing (main)

import Browser
import Html
import Json.Encode
import Knob exposing (Knob)


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { knob : Knob Int }


type Msg
    = KnobUpdated (Knob Int)


init serializedKnob =
    ( { knob =
            -- Create the knob as normal.
            Knob.int
                { step = 1
                , initial = 0
                }
                -- As a final step, deserialize the saved value.
                |> Knob.deserialize serializedKnob
      }
    , Cmd.none
    )


{-| Port we'll use to send the serialized knob state any time it's updated.
-}
port saveKnobState : Json.Encode.Value -> Cmd msg


update msg model =
    case msg of
        KnobUpdated knobState ->
            ( { knob = knobState }
              -- Other than updating the model, we also need to serialize the
              -- updated knob and send it out via a port.
            , Knob.serialize knobState
                |> saveKnobState
            )


view model =
    { title = "elm-knobs LocalStorage example"
    , body =
        [ Html.text "You may change this knob value: "
        , Html.b []
            [ Html.text (String.fromInt (Knob.value model.knob))
            ]
        , Html.text ". After you refresh, it should remain the same."
        , Knob.view KnobUpdated model.knob
        , Knob.styles
        ]
    }
