module KnobTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import Knob exposing (Knob)
import Test exposing (Test)


serialize : Test
serialize =
    Test.describe "Given nice values, equality of two serialized knobs is the same as the equality of their values"
        [ Test.describe "Floats"
            [ Test.fuzz2 Fuzz.niceFloat Fuzz.niceFloat "float" <|
                expectTransitiveEquality
                    (\float -> Knob.float { step = 0.1, initial = float })
            , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatConstrained" <|
                expectTransitiveEquality
                    (\float -> Knob.floatConstrained { range = ( -9999, 9999 ), step = 0.1, initial = float })
            , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatSlider" <|
                expectTransitiveEquality
                    (\float -> Knob.floatSlider { range = ( -9999, 9999 ), step = 0.1, initial = float })
            ]
        , Test.describe "Ints"
            [ Test.fuzz2 Fuzz.int Fuzz.int "int" <|
                expectTransitiveEquality
                    (\int -> Knob.int { step = 1, initial = int })
            , Test.fuzz2 (Fuzz.intRange -1000 1000) (Fuzz.intRange -1000 1000) "intConstrained" <|
                expectTransitiveEquality
                    (\int -> Knob.intConstrained { step = 1, range = ( -1000, 1000 ), initial = int })
            , Test.fuzz2 (Fuzz.intRange -1000 1000) (Fuzz.intRange -1000 1000) "intSlider" <|
                expectTransitiveEquality
                    (\int -> Knob.intSlider { step = 1, range = ( -1000, 1000 ), initial = int })
            ]
        , Test.describe "Other"
            [ Test.fuzz2 Fuzz.bool Fuzz.bool "boolCheckbox" <|
                expectTransitiveEquality
                    Knob.boolCheckbox
            , Test.fuzz2 (Fuzz.oneOfValues vegetables) (Fuzz.oneOfValues vegetables) "select" <|
                expectTransitiveEquality
                    knobSelect
            , Test.fuzz2 fuzzColor fuzzColor "colorPicker" <|
                expectTransitiveEquality
                    Knob.colorPicker
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


expectTransitiveEquality : (a -> Knob a) -> a -> a -> Expectation
expectTransitiveEquality toKnob value1 value2 =
    (Knob.serialize (toKnob value1) == Knob.serialize (toKnob value2))
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
