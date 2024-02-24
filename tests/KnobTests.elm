module KnobTests exposing (..)

import Html exposing (Html)
import Knob exposing (Knob)
import Test
import Test.Html.Event as Event exposing (Event)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


int =
    Test.describe "int"
        [ Test.test "Can input" <|
            \() ->
                Knob.int { step = 1, initial = 0 }
                    |> simulateInput "10"
                    |> Event.expect 10
        , Test.test "Step is only respected at the browser level" <|
            \() ->
                Knob.int { step = 5, initial = 0 }
                    |> simulateInput "12"
                    |> Event.expect 12
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
