module KnobTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import Html.Attributes
import Json.Encode
import Knob exposing (Knob)
import Test exposing (Test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


serialize : Test
serialize =
    Test.describe "Given nice values, equality of two serialized knobs is the same as the equality of their values"
        [ Test.describe "Floats"
            [ Test.fuzz2 Fuzz.niceFloat Fuzz.niceFloat "float" <|
                \float1 float2 ->
                    expectTransitiveEquality
                        float1
                        (Knob.float { step = 0.1, initial = float1 })
                        float2
                        (Knob.float { step = 0.1, initial = float2 })
            , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatConstrained" <|
                \float1 float2 ->
                    expectTransitiveEquality
                        float1
                        (Knob.floatConstrained { range = ( -9999, 9999 ), step = 0.1, initial = float1 })
                        float2
                        (Knob.floatConstrained { range = ( -9999, 9999 ), step = 0.1, initial = float2 })
            , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatSlider" <|
                \float1 float2 ->
                    expectTransitiveEquality
                        float1
                        (Knob.floatSlider { range = ( -9999, 9999 ), step = 0.1, initial = float1 })
                        float2
                        (Knob.floatSlider { range = ( -9999, 9999 ), step = 0.1, initial = float2 })
            ]
        , Test.describe "Ints"
            [ Test.fuzz2 Fuzz.int Fuzz.int "int" <|
                \int1 int2 ->
                    expectTransitiveEquality
                        int1
                        (Knob.int { step = 1, initial = int1 })
                        int2
                        (Knob.int { step = 1, initial = int2 })
            , Test.fuzz2 (Fuzz.intRange -1000 1000) (Fuzz.intRange -1000 1000) "intConstrained" <|
                \int1 int2 ->
                    expectTransitiveEquality
                        int1
                        (Knob.intConstrained { step = 1, range = ( -1000, 1000 ), initial = int1 })
                        int2
                        (Knob.intConstrained { step = 1, range = ( -1000, 1000 ), initial = int2 })
            , Test.fuzz2 (Fuzz.intRange -1000 1000) (Fuzz.intRange -1000 1000) "intSlider" <|
                \int1 int2 ->
                    expectTransitiveEquality
                        int1
                        (Knob.intSlider { step = 1, range = ( -1000, 1000 ), initial = int1 })
                        int2
                        (Knob.intSlider { step = 1, range = ( -1000, 1000 ), initial = int2 })
            ]
        , Test.describe "Other"
            [ Test.fuzz2 Fuzz.bool Fuzz.bool "boolCheckbox" <|
                \bool1 bool2 ->
                    expectTransitiveEquality
                        bool1
                        (Knob.boolCheckbox bool1)
                        bool2
                        (Knob.boolCheckbox bool2)
            , Test.fuzz2 (Fuzz.oneOfValues vegetables) (Fuzz.oneOfValues vegetables) "select" <|
                \value1 value2 ->
                    expectTransitiveEquality
                        value1
                        (knobSelect value1)
                        value2
                        (knobSelect value2)
            , Test.fuzz2 fuzzColor fuzzColor "colorPicker" <|
                \color1 color2 ->
                    expectTransitiveEquality
                        color1
                        (Knob.colorPicker color1)
                        color2
                        (Knob.colorPicker color2)
            ]
        ]


roundTripSerializationTests =
    Test.describe "Round-trip serialization"
        [ Test.describe "Floats"
            [ Test.fuzz2 Fuzz.niceFloat Fuzz.niceFloat "float" <|
                expectFloatRoundTripSerializationToWork
                    (\float -> Knob.float { step = 1, initial = float })
            , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatConstrained" <|
                expectFloatRoundTripSerializationToWork
                    (\float -> Knob.floatConstrained { step = 1, range = ( -9999, 9999 ), initial = float })
            , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatSlider" <|
                expectFloatRoundTripSerializationToWork
                    (\float -> Knob.floatSlider { step = 1, range = ( -9999, 9999 ), initial = float })
            ]
        , Test.describe "Ints"
            [ Test.fuzz2 Fuzz.int Fuzz.int "int" <|
                expectRoundTripSerializationToWork
                    (\int -> Knob.int { step = 1, initial = int })
            , Test.fuzz2 (Fuzz.intRange -9999 9999) (Fuzz.intRange -9999 9999) "intConstrained" <|
                expectRoundTripSerializationToWork
                    (\int -> Knob.intConstrained { step = 1, range = ( -9999, 9999 ), initial = int })
            , Test.fuzz2 (Fuzz.intRange -9999 9999) (Fuzz.intRange -9999 9999) "intSlider" <|
                expectRoundTripSerializationToWork
                    (\int -> Knob.intSlider { step = 1, range = ( -9999, 9999 ), initial = int })
            ]
        , Test.describe "Other"
            [ Test.fuzz2 Fuzz.bool Fuzz.bool "boolCheckbox" <|
                expectRoundTripSerializationToWork
                    Knob.boolCheckbox
            , Test.fuzz2 (Fuzz.oneOfValues vegetables) (Fuzz.oneOfValues vegetables) "select" <|
                expectRoundTripSerializationToWork
                    knobSelect
            , Test.fuzz2 fuzzColor fuzzColor "colorPicker" <|
                expectRoundTripSerializationToWork
                    Knob.colorPicker
            ]
        ]



-- KNOB PRODUCTION


knobSelect : Vegetable -> Knob Vegetable
knobSelect initial =
    Knob.select
        { options = vegetableStrings
        , toString = vegetableToString
        , fromString = vegetableFromString
        , initial = initial
        }


type Vegetable
    = Carrot
    | Lettuce
    | Beet


vegetables =
    [ Carrot, Lettuce, Beet ]


vegetableStrings =
    vegetables
        |> List.map vegetableToString


vegetableToString vegetable =
    case vegetable of
        Carrot ->
            "Carrot"

        Lettuce ->
            "Lettuce"

        Beet ->
            "Beet"


vegetableFromString string =
    case string of
        "Lettuce" ->
            Lettuce

        "Beet" ->
            Beet

        _ ->
            Carrot



-- EXPECTATIONS


expectTransitiveEquality : a -> Knob a -> a -> Knob a -> Expectation
expectTransitiveEquality value1 knob1 value2 knob2 =
    (Knob.serialize knob1 == Knob.serialize knob2)
        |> Expect.equal (value1 == value2)


expectRoundTripSerializationToWork : (a -> Knob a) -> a -> a -> Expectation
expectRoundTripSerializationToWork toKnob value1 value2 =
    if value1 /= value2 then
        let
            serializedValue2 =
                toKnob value2 |> Knob.serialize
        in
        (toKnob value1
            |> Knob.deserialize serializedValue2
            |> Knob.value
        )
            |> Expect.equal value2

    else
        Expect.pass


expectFloatRoundTripSerializationToWork : (Float -> Knob Float) -> Float -> Float -> Expectation
expectFloatRoundTripSerializationToWork toKnob value1 value2 =
    if value1 /= value2 then
        let
            serializedValue2 =
                toKnob value2 |> Knob.serialize
        in
        (toKnob value1
            |> Knob.deserialize serializedValue2
            |> Knob.value
        )
            |> Expect.within (Expect.Absolute 0.0000001) value2

    else
        Expect.pass



-- FUZZERS


fuzzColor : Fuzzer Knob.Color
fuzzColor =
    Fuzz.map3
        (\r g b -> { red = r, green = g, blue = b })
        fuzzColorChannel
        fuzzColorChannel
        fuzzColorChannel


fuzzColorChannel : Fuzzer Float
fuzzColorChannel =
    Fuzz.floatRange 0 1
