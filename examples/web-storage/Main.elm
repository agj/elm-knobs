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
    { knob : Knob Controls }


type alias Controls =
    { bool : Bool
    , int : Int
    }


type Msg
    = KnobUpdated (Knob Controls)


{-| We're using flags to bring the previously stored value from JavaScript land.
-}
init serializedKnob =
    ( { knob =
            -- Create the knob as normal.
            Knob.compose Controls
                |> Knob.stack (Knob.boolCheckbox True)
                |> Knob.stack (Knob.int { step = 1, initial = 0 })
                -- As a final step, deserialize the saved value.
                |> Knob.readSerialized serializedKnob
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
    let
        controls =
            Knob.value model.knob
    in
    { title = "elm-knobs LocalStorage example"
    , body =
        [ Html.p [] [ Html.text "You may change these knob values:" ]
        , Html.p []
            [ Html.b []
                [ Html.text
                    (if controls.bool then
                        "True"

                     else
                        "False"
                    )
                , Html.text " "
                , Html.text (String.fromInt controls.int)
                ]
            ]
        , Html.p [] [ Html.text "After you refresh the page, the values should remain the same." ]
        , Knob.view KnobUpdated model.knob
        , Knob.styles
        ]
    }
