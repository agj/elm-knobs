module KnobTests exposing (..)

import Fuzz
import Html exposing (Html)
import Knob exposing (Knob)
import Test
import Test.Html.Event as Event exposing (Event)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


int =
    Test.describe "int"
        [ Test.fuzz Fuzz.int "Can input valid values" <|
            \intInput ->
                Knob.int { step = 1, initial = 0 }
                    |> simulateInput (String.fromInt intInput)
                    |> Event.expect intInput
        , Test.fuzz Fuzz.int "Step is only respected at the browser level" <|
            \intInput ->
                Knob.int { step = 5, initial = 0 }
                    |> simulateInput (String.fromInt intInput)
                    |> Event.expect intInput
        , Test.fuzz2 Fuzz.int Fuzz.string "Invalid values result in the initial value" <|
            \initial stringInput ->
                let
                    invalidInput =
                        case String.toInt stringInput of
                            Just _ ->
                                ""

                            Nothing ->
                                stringInput
                in
                Knob.int { step = 1, initial = initial }
                    |> simulateInput invalidInput
                    |> Event.expect initial
        ]


{-| Creates a test event of the type of the knob, for a given string input on the
knob's HTML <input> tag.
-}
simulateInput : String -> Knob a -> Event a
simulateInput inputString knob =
    knob
        |> Knob.view Knob.value
        |> Query.fromHtml
        |> Query.find [ Selector.tag "input" ]
        |> Event.simulate (Event.input inputString)
