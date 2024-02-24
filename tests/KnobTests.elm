module KnobTests exposing (..)

import Html exposing (Html)
import Knob exposing (Knob)
import Test
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector as Selector


int =
    Test.describe "int"
        [ Test.test "bla" <|
            \() ->
                Knob.int { step = 1, initial = 0 }
                    |> Knob.view Knob.value
                    |> Query.fromHtml
                    |> Query.find [ Selector.tag "input" ]
                    |> Event.simulate (Event.input "10")
                    |> Event.expect 10
        ]
