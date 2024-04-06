module SerializationTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import Knob exposing (Knob)
import Test


transitiveEqualityTests =
    Test.describe "Given nice values, equality of two serialized knobs is the same as the equality of their values"
        [ Test.fuzz2 Fuzz.niceFloat Fuzz.niceFloat "float" <|
            expectTransitiveEquality
                (\float -> Knob.float { step = 0.1, initial = float })
        , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatConstrained" <|
            expectTransitiveEquality
                (\float -> Knob.floatConstrained { range = ( -9999, 9999 ), step = 0.1, initial = float })
        , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatSlider" <|
            expectTransitiveEquality
                (\float -> Knob.floatSlider { range = ( -9999, 9999 ), step = 0.1, initial = float })
        , Test.fuzz2 Fuzz.int Fuzz.int "int" <|
            expectTransitiveEquality
                (\int -> Knob.int { step = 1, initial = int })
        , Test.fuzz2 (Fuzz.intRange -1000 1000) (Fuzz.intRange -1000 1000) "intConstrained" <|
            expectTransitiveEquality
                (\int -> Knob.intConstrained { step = 1, range = ( -1000, 1000 ), initial = int })
        , Test.fuzz2 (Fuzz.intRange -1000 1000) (Fuzz.intRange -1000 1000) "intSlider" <|
            expectTransitiveEquality
                (\int -> Knob.intSlider { step = 1, range = ( -1000, 1000 ), initial = int })
        , Test.fuzz2 Fuzz.string Fuzz.string "stringInput" <|
            expectTransitiveEquality
                Knob.stringInput
        , Test.fuzz2 Fuzz.string Fuzz.string "stringTextarea" <|
            expectTransitiveEquality
                (\string -> Knob.stringTextarea { columns = Nothing, rows = Nothing, initial = string })
        , Test.fuzz2 Fuzz.bool Fuzz.bool "boolCheckbox" <|
            expectTransitiveEquality
                Knob.boolCheckbox
        , Test.fuzz2 (Fuzz.oneOfValues vegetables) (Fuzz.oneOfValues vegetables) "select" <|
            expectTransitiveEquality
                knobSelect
        , Test.fuzz2 fuzzColor fuzzColor "colorPicker" <|
            expectTransitiveEquality
                Knob.colorPicker
        , Test.fuzz2
            (Fuzz.triple Fuzz.int Fuzz.niceFloat fuzzColor)
            (Fuzz.triple Fuzz.int Fuzz.niceFloat fuzzColor)
            "compose"
          <|
            expectTransitiveEquality
                (\( int, float, color ) ->
                    Knob.compose (\a b c -> ( a, b, c ))
                        |> Knob.stack (Knob.int { step = 1, initial = int })
                        |> Knob.stack (Knob.float { step = 1, initial = float })
                        |> Knob.stack (Knob.colorPicker color)
                )
        , Test.fuzz2
            (Fuzz.triple Fuzz.int Fuzz.niceFloat fuzzColor)
            (Fuzz.triple Fuzz.int Fuzz.niceFloat fuzzColor)
            "compose with label"
          <|
            expectTransitiveEquality
                (\( int, float, color ) ->
                    Knob.compose (\a b c -> ( a, b, c ))
                        |> Knob.stackLabel "int" (Knob.int { step = 1, initial = int })
                        |> Knob.stackLabel "float" (Knob.float { step = 1, initial = float })
                        |> Knob.stackLabel "color" (Knob.colorPicker color)
                )
        , Test.fuzz2 Fuzz.int Fuzz.int "map" <|
            expectTransitiveEquality
                (\int ->
                    Knob.int { step = 1, initial = int }
                        |> Knob.map String.fromInt
                )
        ]


roundTripSerializationTests =
    Test.describe "Knobs should serialize and then deserialize into the same original value"
        [ Test.fuzz2 Fuzz.niceFloat Fuzz.niceFloat "float" <|
            expectFloatRoundTripSerializationToWork
                (\float -> Knob.float { step = 1, initial = float })
        , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatConstrained" <|
            expectFloatRoundTripSerializationToWork
                (\float -> Knob.floatConstrained { step = 1, range = ( -9999, 9999 ), initial = float })
        , Test.fuzz2 (Fuzz.floatRange -9999 9999) (Fuzz.floatRange -9999 9999) "floatSlider" <|
            expectFloatRoundTripSerializationToWork
                (\float -> Knob.floatSlider { step = 1, range = ( -9999, 9999 ), initial = float })
        , Test.fuzz2 Fuzz.int Fuzz.int "int" <|
            expectRoundTripSerializationToWork
                (\int -> Knob.int { step = 1, initial = int })
        , Test.fuzz2 (Fuzz.intRange -9999 9999) (Fuzz.intRange -9999 9999) "intConstrained" <|
            expectRoundTripSerializationToWork
                (\int -> Knob.intConstrained { step = 1, range = ( -9999, 9999 ), initial = int })
        , Test.fuzz2 (Fuzz.intRange -9999 9999) (Fuzz.intRange -9999 9999) "intSlider" <|
            expectRoundTripSerializationToWork
                (\int -> Knob.intSlider { step = 1, range = ( -9999, 9999 ), initial = int })
        , Test.fuzz2 Fuzz.string Fuzz.string "stringInput" <|
            expectRoundTripSerializationToWork
                Knob.stringInput
        , Test.fuzz2 Fuzz.string Fuzz.string "stringTextarea" <|
            expectRoundTripSerializationToWork
                (\string -> Knob.stringTextarea { columns = Nothing, rows = Nothing, initial = string })
        , Test.fuzz2 Fuzz.bool Fuzz.bool "boolCheckbox" <|
            expectRoundTripSerializationToWork
                Knob.boolCheckbox
        , Test.fuzz2 (Fuzz.oneOfValues vegetables) (Fuzz.oneOfValues vegetables) "select" <|
            expectRoundTripSerializationToWork
                knobSelect
        , Test.fuzz2 fuzzColor fuzzColor "colorPicker" <|
            expectRoundTripSerializationToWork
                Knob.colorPicker
        , Test.fuzz2
            (Fuzz.triple Fuzz.int Fuzz.niceFloat fuzzColor)
            (Fuzz.triple Fuzz.int Fuzz.niceFloat fuzzColor)
            "compose"
          <|
            expectRoundTripSerializationToWork
                (\( int, float, color ) ->
                    Knob.compose (\a b c -> ( a, b, c ))
                        |> Knob.stack (Knob.int { step = 1, initial = int })
                        |> Knob.stack (Knob.float { step = 1, initial = float })
                        |> Knob.stack (Knob.colorPicker color)
                )
        , Test.fuzz2
            (Fuzz.triple Fuzz.int Fuzz.niceFloat fuzzColor)
            (Fuzz.triple Fuzz.int Fuzz.niceFloat fuzzColor)
            "compose with label"
          <|
            expectRoundTripSerializationToWork
                (\( int, float, color ) ->
                    Knob.compose (\a b c -> ( a, b, c ))
                        |> Knob.stackLabel "int" (Knob.int { step = 1, initial = int })
                        |> Knob.stackLabel "float" (Knob.float { step = 1, initial = float })
                        |> Knob.stackLabel "color" (Knob.colorPicker color)
                )
        , Test.fuzz2 Fuzz.int Fuzz.int "map" <|
            expectMappedRoundTripSerializationToWork
                String.fromInt
                (\int ->
                    Knob.int { step = 1, initial = int }
                        |> Knob.map String.fromInt
                )
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


expectTransitiveEquality : (a -> Knob b) -> a -> a -> Expectation
expectTransitiveEquality toKnob value1 value2 =
    (Knob.serialize (toKnob value1) == Knob.serialize (toKnob value2))
        |> Expect.equal (value1 == value2)


expectRoundTripSerializationToWork : (a -> Knob a) -> a -> a -> Expectation
expectRoundTripSerializationToWork =
    expectMappedRoundTripSerializationToWork identity


expectMappedRoundTripSerializationToWork : (a -> b) -> (a -> Knob b) -> a -> a -> Expectation
expectMappedRoundTripSerializationToWork mapper toKnob value1 value2 =
    if value1 /= value2 then
        let
            serializedValue2 =
                toKnob value2
                    |> Knob.serialize
        in
        Expect.all
            [ \_ ->
                (toKnob value1
                    |> Knob.readSerialized serializedValue2
                    |> Knob.value
                )
                    |> Expect.equal (mapper value2)

            -- Sanity checks.
            , \_ ->
                (toKnob value1 |> Knob.value)
                    |> Expect.equal (mapper value1)
            , \_ ->
                (toKnob value2 |> Knob.value)
                    |> Expect.equal (mapper value2)
            ]
            ()

    else
        -- Don't bother when both values are the same.
        Expect.pass


expectFloatRoundTripSerializationToWork : (Float -> Knob Float) -> Float -> Float -> Expectation
expectFloatRoundTripSerializationToWork toKnob value1 value2 =
    if value1 /= value2 then
        let
            serializedValue2 =
                toKnob value2 |> Knob.serialize
        in
        Expect.all
            [ \_ ->
                (toKnob value1
                    |> Knob.readSerialized serializedValue2
                    |> Knob.value
                )
                    |> Expect.within (Expect.Absolute 0.0000001) value2

            -- Sanity checks.
            , \_ ->
                (toKnob value1 |> Knob.value)
                    |> Expect.within (Expect.Absolute 0.0000001) value1
            , \_ ->
                (toKnob value2 |> Knob.value)
                    |> Expect.within (Expect.Absolute 0.0000001) value2
            ]
            ()

    else
        -- Don't bother when both values are the same.
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
