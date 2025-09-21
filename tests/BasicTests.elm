module BasicTests exposing (..)

import Dict
import Expect
import Fuzz exposing (Fuzzer)
import Internal.Utils exposing (expectAll)
import Knob
import Test exposing (Test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector
import Util.TestKnob
    exposing
        ( Vegetable(..)
        , knobSelect
        , queryView
        , simulateCheckInput
        , simulateInput
        , simulateInputs
        , simulateSelectInput
        , simulateSelectInputs
        , simulateTextareaInput
        , vegetableStrings
        , vegetables
        )


floatTests : Test
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


floatConstrainedTests : Test
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


floatSliderTests : Test
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


intTests : Test
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


intConstrainedTests : Test
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


intSliderTests : Test
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


stringInputTests : Test
stringInputTests =
    Test.describe "stringInput"
        [ Test.fuzz2 Fuzz.string Fuzz.string "Can input" <|
            \initial input ->
                Knob.stringInput initial
                    |> simulateInput input
                    |> Expect.equal (Just input)
        ]


stringTextareaTests : Test
stringTextareaTests =
    Test.describe "stringTextarea"
        [ Test.fuzz2 Fuzz.string Fuzz.string "Can input" <|
            \initial input ->
                Knob.stringTextarea { initial = initial, columns = Nothing, rows = Nothing }
                    |> simulateTextareaInput input
                    |> Expect.equal (Just input)
        ]


boolCheckboxTests : Test
boolCheckboxTests =
    Test.describe "boolCheckbox"
        [ Test.fuzz2 Fuzz.bool Fuzz.bool "Can input" <|
            \initial input ->
                Knob.boolCheckbox initial
                    |> simulateCheckInput input
                    |> Expect.equal (Just input)
        ]


selectTests : Test
selectTests =
    Test.describe "select"
        [ Test.fuzz2
            (Fuzz.oneOfValues vegetables)
            (Fuzz.oneOfValues vegetableStrings)
            "Can input valid values"
          <|
            \initial input ->
                let
                    { knob, fromString } =
                        knobSelect initial
                in
                knob
                    |> simulateSelectInput input
                    |> Expect.equal (Just (fromString input))
        , Test.fuzz2
            (Fuzz.oneOfValues vegetables)
            Fuzz.string
            "Invalid values result in the initial value"
          <|
            \initial invalidInput ->
                knobSelect initial
                    |> .knob
                    |> simulateSelectInput invalidInput
                    |> Expect.equal (Just initial)
        , Test.fuzz2
            (Fuzz.oneOfValues vegetables)
            (Fuzz.pair (Fuzz.oneOfValues vegetableStrings) Fuzz.string)
            "Invalid values after a correct value still result in the initial value"
          <|
            \initial ( input, invalidInput ) ->
                knobSelect initial
                    |> .knob
                    |> simulateSelectInputs input [ invalidInput ]
                    |> Expect.equal (Just initial)
        , Test.fuzz (Fuzz.listOfLengthBetween 1 100 Fuzz.string) "Options are displayed in supplied order" <|
            \labels ->
                let
                    options =
                        labels
                            |> List.map (\label -> ( label, label ))

                    optionElements =
                        Knob.select
                            { options = options
                            , initial = ""
                            }
                            |> queryView
                            |> Query.findAll [ Selector.tag "option" ]
                in
                (labels
                    |> List.indexedMap
                        (\index label ->
                            optionElements
                                |> Query.index index
                                |> Query.has [ Selector.exactText label ]
                        )
                )
                    |> expectAll
        ]


colorPickerTests : Test
colorPickerTests =
    let
        colors =
            [ { hex = "#000000"
              , rgb = { red = 0, green = 0, blue = 0 }
              }
            , { hex = "#ffffff"
              , rgb = { red = 1, green = 1, blue = 1 }
              }
            , { hex = "#fff5ee"
              , rgb = { red = 0xFF / 0xFF, green = 0xF5 / 0xFF, blue = 0xEE / 0xFF }
              }
            , { hex = "#fa8072"
              , rgb = { red = 0xFA / 0xFF, green = 0x80 / 0xFF, blue = 0x72 / 0xFF }
              }
            , { hex = "#dda0dd"
              , rgb = { red = 0xDD / 0xFF, green = 0xA0 / 0xFF, blue = 0xDD / 0xFF }
              }
            ]
    in
    Test.describe "colorPicker"
        [ Test.fuzz2 (Fuzz.oneOfValues colors) (Fuzz.oneOfValues colors) "Can input valid values" <|
            \initial input ->
                Knob.colorPicker initial.rgb
                    |> simulateInput input.hex
                    |> Expect.equal (Just input.rgb)
        , Test.fuzz2 (Fuzz.oneOfValues colors) Fuzz.string "Invalid values result in the initial value" <|
            \initial invalidInput ->
                Knob.colorPicker initial.rgb
                    |> simulateInput invalidInput
                    |> Expect.equal (Just initial.rgb)
        , Test.fuzz3
            (Fuzz.oneOfValues colors)
            (Fuzz.oneOfValues colors)
            Fuzz.string
            "Invalid values after a correct value still result in the initial value"
          <|
            \initial input invalidInput ->
                Knob.colorPicker initial.rgb
                    |> simulateInputs input.hex [ invalidInput ]
                    |> Expect.equal (Just initial.rgb)
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


fuzzFloatRangeInputs : Fuzzer { lowest : Float, low : Float, mid : Float, high : Float, highest : Float, any : Float, any2 : Float }
fuzzFloatRangeInputs =
    fuzzRangeInputs Fuzz.niceFloat


fuzzIntRangeInputs : Fuzzer { lowest : Int, low : Int, mid : Int, high : Int, highest : Int, any : Int, any2 : Int }
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
