module KnobTests exposing (..)

import Expect
import Fuzz
import Knob exposing (Knob)
import Test
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector as Selector


float =
    Test.describe "float"
        [ Test.fuzz Fuzz.niceFloat "Can input valid values" <|
            \floatInput ->
                Knob.float { step = 0.1, initial = 0 }
                    |> simulateInput (String.fromFloat floatInput)
                    |> Expect.equal (Just floatInput)
        , Test.fuzz Fuzz.niceFloat "Step is only respected at the browser level" <|
            \floatInput ->
                Knob.float { step = 5, initial = 0 }
                    |> simulateInput (String.fromFloat floatInput)
                    |> Expect.equal (Just floatInput)
        , Test.fuzz2 Fuzz.niceFloat Fuzz.string "Invalid values result in the initial value" <|
            \initial stringInput ->
                let
                    invalidInput =
                        case String.toFloat stringInput of
                            Just _ ->
                                ""

                            Nothing ->
                                stringInput
                in
                Knob.float { step = 1, initial = initial }
                    |> simulateInput invalidInput
                    |> Expect.equal (Just initial)
        , Test.fuzz2 Fuzz.int Fuzz.string "Invalid values after a correct value still result in the initial value" <|
            \initial stringInput ->
                let
                    invalidInput =
                        case String.toInt stringInput of
                            Just _ ->
                                "x"

                            Nothing ->
                                stringInput ++ "x"
                in
                Knob.int { step = 1, initial = initial }
                    |> simulateInputs "123" [ "45.2", invalidInput ]
                    |> Expect.equal (Just initial)
        ]


int =
    Test.describe "int"
        [ Test.fuzz Fuzz.int "Can input valid values" <|
            \intInput ->
                Knob.int { step = 1, initial = 0 }
                    |> simulateInput (String.fromInt intInput)
                    |> Expect.equal (Just intInput)
        , Test.fuzz Fuzz.int "Step is only respected at the browser level" <|
            \intInput ->
                Knob.int { step = 5, initial = 0 }
                    |> simulateInput (String.fromInt intInput)
                    |> Expect.equal (Just intInput)
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
                    |> Expect.equal (Just initial)
        , Test.fuzz2 Fuzz.int Fuzz.string "Invalid values after a correct value still result in the initial value" <|
            \initial stringInput ->
                let
                    invalidInput =
                        case String.toInt stringInput of
                            Just _ ->
                                "x"

                            Nothing ->
                                stringInput ++ "x"
                in
                Knob.int { step = 1, initial = initial }
                    |> simulateInputs "123" [ "45", invalidInput ]
                    |> Expect.equal (Just initial)
        ]


{-| Creates a test event of the type of the knob, for a given string input on the
knob's HTML <input> tag.
-}
simulateInput : String -> Knob a -> Maybe a
simulateInput inputString knob =
    knob
        |> simulateInputAnd inputString
        |> Maybe.map Knob.value


simulateInputs : String -> List String -> Knob a -> Maybe a
simulateInputs firstInputString restInputStrings knob =
    let
        proc : String -> Maybe (Knob a) -> Maybe (Knob a)
        proc inputString =
            Maybe.andThen (simulateInputAnd inputString)
    in
    List.foldl
        proc
        (Just knob)
        (firstInputString :: restInputStrings)
        |> Maybe.map Knob.value


simulateInputAnd : String -> Knob a -> Maybe (Knob a)
simulateInputAnd inputString knob =
    knob
        |> Knob.view identity
        |> Query.fromHtml
        |> Query.find [ Selector.tag "input" ]
        |> Event.simulate (Event.input inputString)
        |> Event.toResult
        |> Result.toMaybe
