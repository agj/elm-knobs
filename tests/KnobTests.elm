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


intConstrainedTests =
    Test.describe "intConstrained"
        [ Test.fuzz fuzzIntRangeInputs "Can input valid values" <|
            \{ lowest, highest, any, any2 } ->
                Knob.intConstrained { step = 1, range = ( lowest, highest ), initial = any }
                    |> simulateInput (String.fromInt any2)
                    |> Expect.equal (Just any2)
        , Test.fuzz fuzzIntRangeInputs "Out of range values result in a clamped value" <|
            \{ low, high, lowest, highest, mid } ->
                Knob.intConstrained { step = 1, range = ( low, high ), initial = mid }
                    |> Expect.all
                        [ simulateInput (String.fromInt lowest)
                            >> Expect.equal (Just low)
                        , simulateInput (String.fromInt highest)
                            >> Expect.equal (Just high)
                        ]
        , Test.fuzz2 fuzzIntRangeInputs fuzzNonEmptyNonNumericString "Invalid values result in the initial value" <|
            \{ lowest, highest, mid } invalidInput ->
                Knob.intConstrained { step = 1, range = ( lowest, highest ), initial = mid }
                    |> simulateInput invalidInput
                    |> Expect.equal (Just mid)
        , Test.fuzz2 fuzzIntRangeInputs fuzzNonNumericString "Invalid values after a correct value still result in the initial value" <|
            \{ lowest, highest, mid, any, any2 } invalidInput ->
                Knob.intConstrained { step = 1, range = ( lowest, highest ), initial = mid }
                    |> simulateInputs (String.fromInt any) [ String.fromInt any2, invalidInput ]
                    |> Expect.equal (Just mid)
        ]


intSliderTests =
    Test.describe "intSlider"
        [ Test.fuzz fuzzIntRangeInputs "Can input valid values" <|
            \{ lowest, highest, any, any2 } ->
                Knob.intSlider { step = 1, range = ( lowest, highest ), initial = any }
                    |> simulateInput (String.fromInt any2)
                    |> Expect.equal (Just any2)
        , Test.fuzz fuzzIntRangeInputs "Out of range values result in a clamped value" <|
            \{ low, high, lowest, highest, mid } ->
                Knob.intSlider { step = 1, range = ( low, high ), initial = mid }
                    |> Expect.all
                        [ simulateInput (String.fromInt lowest)
                            >> Expect.equal (Just low)
                        , simulateInput (String.fromInt highest)
                            >> Expect.equal (Just high)
                        ]
        , Test.fuzz2 fuzzIntRangeInputs fuzzNonEmptyNonNumericString "Invalid values result in the initial value" <|
            \{ lowest, highest, mid } invalidInput ->
                Knob.intSlider { step = 1, range = ( lowest, highest ), initial = mid }
                    |> simulateInput invalidInput
                    |> Expect.equal (Just mid)
        , Test.fuzz2 fuzzIntRangeInputs fuzzNonNumericString "Invalid values after a correct value still result in the initial value" <|
            \{ lowest, highest, mid, any, any2 } invalidInput ->
                Knob.intSlider { step = 1, range = ( lowest, highest ), initial = mid }
                    |> simulateInputs (String.fromInt any) [ String.fromInt any2, invalidInput ]
                    |> Expect.equal (Just mid)
        ]


stringInputTests =
    Test.describe "stringInput"
        [ Test.fuzz2 Fuzz.string Fuzz.string "Can input" <|
            \initial input ->
                Knob.stringInput initial
                    |> simulateInput input
                    |> Expect.equal (Just input)
        ]


stringTextareaTests =
    Test.describe "stringTextarea"
        [ Test.fuzz2 Fuzz.string Fuzz.string "Can input" <|
            \initial input ->
                Knob.stringTextarea { initial = initial, columns = Nothing, rows = Nothing }
                    |> simulateTextareaInput input
                    |> Expect.equal (Just input)
        ]


boolCheckboxTests =
    Test.describe "boolCheckbox"
        [ Test.fuzz2 Fuzz.bool Fuzz.bool "Can input" <|
            \initial input ->
                Knob.boolCheckbox initial
                    |> simulateCheckInput input
                    |> Expect.equal (Just input)
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


fuzzFloatRangeInputs =
    fuzzRangeInputs Fuzz.niceFloat


fuzzIntRangeInputs =
    fuzzRangeInputs Fuzz.int


fuzzRangeInputs :
    Fuzzer number
    ->
        Fuzzer
            { lowest : number
            , low : number
            , mid : number
            , high : number
            , highest : number
            , any : number
            , any2 : number
            }
fuzzRangeInputs fuzzer =
    Fuzz.listOfLength 5 fuzzer
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
        |> simulateInputAnd "input" inputString
        |> Maybe.map Knob.value


{-| Same as `simulateInput`, but simulates a sequence of inputs instead of just
one. The first input is required, the rest are supplied as an array.
-}
simulateInputs : String -> List String -> Knob a -> Maybe a
simulateInputs firstInputString restInputStrings knob =
    let
        proc : String -> Maybe (Knob a) -> Maybe (Knob a)
        proc inputString =
            Maybe.andThen (simulateInputAnd "input" inputString)
    in
    List.foldl
        proc
        (Just knob)
        (firstInputString :: restInputStrings)
        |> Maybe.map Knob.value


{-| The same as `simulateInput`, but the element is `<textarea>`.
-}
simulateTextareaInput : String -> Knob a -> Maybe a
simulateTextareaInput inputString knob =
    knob
        |> simulateInputAnd "textarea" inputString
        |> Maybe.map Knob.value


{-| Used to string multiple inputs into the same knob, this function simulates
entering one text input into an element of the supplied tag (usually `"input"`),
and returns a `Maybe` of the updated knob.
-}
simulateInputAnd : String -> String -> Knob a -> Maybe (Knob a)
simulateInputAnd tag inputString knob =
    knob
        |> Knob.view identity
        |> Query.fromHtml
        |> Query.find [ Selector.tag tag ]
        |> Event.simulate (Event.input inputString)
        |> Event.toResult
        |> Result.toMaybe


simulateCheckInput : Bool -> Knob Bool -> Maybe Bool
simulateCheckInput input knob =
    knob
        |> Knob.view identity
        |> Query.fromHtml
        |> Query.find [ Selector.tag "input" ]
        |> Event.simulate (Event.check input)
        |> Event.toResult
        |> Result.toMaybe
        |> Maybe.map Knob.value
