module KnobTests exposing (..)

import Array
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


floatConstrained =
    Test.describe "floatConstrained"
        [ Test.fuzz (Fuzz.listOfLength 4 Fuzz.niceFloat) "Can input valid values" <|
            \floatValues ->
                let
                    floatValuesArray =
                        Array.fromList floatValues

                    sorted =
                        floatValues
                            |> List.sort
                            |> Array.fromList

                    rangeFrom =
                        Array.get 0 sorted
                            |> Maybe.withDefault 0

                    rangeTo =
                        Array.get (Array.length sorted - 1) sorted
                            |> Maybe.withDefault 0

                    initial =
                        Array.get 0 floatValuesArray
                            |> Maybe.withDefault 0

                    input =
                        Array.get 1 floatValuesArray
                            |> Maybe.withDefault 0
                in
                Knob.floatConstrained { step = 0.1, range = ( rangeFrom, rangeTo ), initial = initial }
                    |> simulateInput (String.fromFloat input)
                    |> Expect.equal (Just input)
        , Test.fuzz (Fuzz.listOfLength 5 Fuzz.niceFloat) "Out of range values result in a clamped value" <|
            \floatValues ->
                let
                    sorted =
                        floatValues
                            |> List.sort

                    { tooLow, tooHigh, rangeFrom, rangeTo, initial } =
                        case sorted of
                            [ tooLow_, rangeFrom_, initial_, rangeTo_, tooHigh_ ] ->
                                { tooLow = tooLow_
                                , tooHigh = tooHigh_
                                , rangeFrom = rangeFrom_
                                , rangeTo = rangeTo_
                                , initial = initial_
                                }

                            _ ->
                                { tooLow = 0
                                , tooHigh = 0
                                , rangeFrom = 0
                                , rangeTo = 0
                                , initial = 0
                                }
                in
                Knob.floatConstrained { step = 0.1, range = ( rangeFrom, rangeTo ), initial = initial }
                    |> Expect.all
                        [ simulateInput (String.fromFloat tooLow)
                            >> Expect.equal (Just rangeFrom)
                        , simulateInput (String.fromFloat tooHigh)
                            >> Expect.equal (Just rangeTo)
                        ]
        ]


int =
    Test.describe "int"
        [ Test.fuzz Fuzz.int "Can input valid values" <|
            \intInput ->
                Knob.int { step = 1, initial = 0 }
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
