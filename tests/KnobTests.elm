module KnobTests exposing (..)

import Expect
import Fuzz exposing (Fuzzer)
import Knob exposing (Knob)
import Test
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector as Selector


floatTests =
    Test.describe "float"
        [ Test.fuzz Fuzz.niceFloat "Can input valid values" <|
            \floatInput ->
                Knob.float { step = 0.1, initial = 0 }
                    |> simulateInput (String.fromFloat floatInput)
                    |> Expect.equal (Just floatInput)
        , Test.fuzz2 Fuzz.niceFloat fuzzNonNumericString "Invalid values result in the initial value" <|
            \initial invalidInput ->
                Knob.float { step = 1, initial = initial }
                    |> simulateInput invalidInput
                    |> Expect.equal (Just initial)
        , Test.fuzz2 Fuzz.int fuzzNonEmptyNonNumericString "Invalid values after a correct value still result in the initial value" <|
            \initial invalidInput ->
                Knob.int { step = 1, initial = initial }
                    |> simulateInputs "123" [ "45.2", invalidInput ]
                    |> Expect.equal (Just initial)
        ]


floatConstrainedTests =
    Test.describe "floatConstrained"
        [ Test.fuzz fuzzFloatRangeInputs "Can input valid values" <|
            \{ lowest, highest, any, any2 } ->
                Knob.floatConstrained { step = 0.1, range = ( lowest, highest ), initial = any }
                    |> simulateInput (String.fromFloat any2)
                    |> Expect.equal (Just any2)
        , Test.fuzz fuzzFloatRangeInputs "Out of range values result in a clamped value" <|
            \{ low, high, lowest, highest, mid } ->
                Knob.floatConstrained { step = 0.1, range = ( low, high ), initial = mid }
                    |> Expect.all
                        [ simulateInput (String.fromFloat lowest)
                            >> Expect.equal (Just low)
                        , simulateInput (String.fromFloat highest)
                            >> Expect.equal (Just high)
                        ]
        , Test.fuzz2 fuzzFloatRangeInputs fuzzNonEmptyNonNumericString "Invalid values result in the initial value" <|
            \{ lowest, highest, mid } invalidInput ->
                Knob.floatConstrained { step = 0.1, range = ( lowest, highest ), initial = mid }
                    |> simulateInput invalidInput
                    |> Expect.equal (Just mid)
        , Test.fuzz2 fuzzFloatRangeInputs fuzzNonNumericString "Invalid values after a correct value still result in the initial value" <|
            \{ lowest, highest, mid, any, any2 } invalidInput ->
                Knob.floatConstrained { step = 0.1, range = ( lowest, highest ), initial = mid }
                    |> simulateInputs (String.fromFloat any) [ String.fromFloat any2, invalidInput ]
                    |> Expect.equal (Just mid)
        ]


floatSliderTests =
    Test.describe "floatSlider"
        [ Test.fuzz fuzzFloatRangeInputs "Can input valid values" <|
            \{ lowest, highest, any, any2 } ->
                Knob.floatSlider { step = 0.1, range = ( lowest, highest ), initial = any }
                    |> simulateInput (String.fromFloat any2)
                    |> Expect.equal (Just any2)
        , Test.fuzz fuzzFloatRangeInputs "Out of range values result in a clamped value" <|
            \{ low, high, lowest, highest, mid } ->
                Knob.floatSlider { step = 0.1, range = ( low, high ), initial = mid }
                    |> Expect.all
                        [ simulateInput (String.fromFloat lowest)
                            >> Expect.equal (Just low)
                        , simulateInput (String.fromFloat highest)
                            >> Expect.equal (Just high)
                        ]
        , Test.fuzz2 fuzzFloatRangeInputs fuzzNonEmptyNonNumericString "Invalid values result in the initial value" <|
            \{ lowest, highest, mid } invalidInput ->
                Knob.floatSlider { step = 0.1, range = ( lowest, highest ), initial = mid }
                    |> simulateInput invalidInput
                    |> Expect.equal (Just mid)
        , Test.fuzz2 fuzzFloatRangeInputs fuzzNonNumericString "Invalid values after a correct value still result in the initial value" <|
            \{ lowest, highest, mid, any, any2 } invalidInput ->
                Knob.floatSlider { step = 0.1, range = ( lowest, highest ), initial = mid }
                    |> simulateInputs (String.fromFloat any) [ String.fromFloat any2, invalidInput ]
                    |> Expect.equal (Just mid)
        ]


intTests =
    Test.describe "int"
        [ Test.fuzz Fuzz.int "Can input valid values" <|
            \intInput ->
                Knob.int { step = 1, initial = 0 }
                    |> simulateInput (String.fromInt intInput)
                    |> Expect.equal (Just intInput)
        , Test.fuzz2 Fuzz.int fuzzNonNumericString "Invalid values result in the initial value" <|
            \initial invalidInput ->
                Knob.int { step = 1, initial = initial }
                    |> simulateInput invalidInput
                    |> Expect.equal (Just initial)
        , Test.fuzz2 Fuzz.int fuzzNonEmptyNonNumericString "Invalid values after a correct value still result in the initial value" <|
            \initial invalidInput ->
                Knob.int { step = 1, initial = initial }
                    |> simulateInputs "123" [ "45", invalidInput ]
                    |> Expect.equal (Just initial)
        ]



-- FUZZERS


fuzzNonNumericString : Fuzzer String
fuzzNonNumericString =
    Fuzz.string
        |> Fuzz.map
            (\string ->
                case String.toFloat string of
                    Just _ ->
                        ""

                    Nothing ->
                        string
            )


fuzzNonEmptyNonNumericString : Fuzzer String
fuzzNonEmptyNonNumericString =
    Fuzz.string
        |> Fuzz.map
            (\string ->
                case String.toFloat string of
                    Just _ ->
                        "x"

                    Nothing ->
                        string
            )


fuzzFloatRangeInputs :
    Fuzzer
        { lowest : Float
        , low : Float
        , mid : Float
        , high : Float
        , highest : Float
        , any : Float
        , any2 : Float
        }
fuzzFloatRangeInputs =
    Fuzz.listOfLength 5 Fuzz.niceFloat
        |> Fuzz.map
            (\unsorted ->
                let
                    sorted =
                        List.sort unsorted
                in
                case ( unsorted, sorted ) of
                    ( any_ :: any2_ :: _, [ lowest_, low_, mid_, high_, highest_ ] ) ->
                        { lowest = lowest_
                        , low = low_
                        , mid = mid_
                        , high = high_
                        , highest = highest_
                        , any = any_
                        , any2 = any2_
                        }

                    _ ->
                        { lowest = 10
                        , low = 0
                        , mid = 10
                        , high = 0
                        , highest = 10
                        , any = 0
                        , any2 = 0
                        }
            )



-- INPUT


{-| Simulates entering some text into the knob's `<input>` element, and returns
a `Maybe` of the value that the knob emits out of the interaction.
-}
simulateInput : String -> Knob a -> Maybe a
simulateInput inputString knob =
    knob
        |> simulateInputAnd inputString
        |> Maybe.map Knob.value


{-| Same as `simulateInput`, but simulates a sequence of inputs instead of just
one. The first input is required, the rest are supplied as an array.
-}
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


{-| Used to string multiple inputs into the same knob, this function simulates
entering one text input into its `<input>` element, and returns a `Maybe` of the
updated knob.
-}
simulateInputAnd : String -> Knob a -> Maybe (Knob a)
simulateInputAnd inputString knob =
    knob
        |> Knob.view identity
        |> Query.fromHtml
        |> Query.find [ Selector.tag "input" ]
        |> Event.simulate (Event.input inputString)
        |> Event.toResult
        |> Result.toMaybe
