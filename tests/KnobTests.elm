module KnobTests exposing (..)

import Dict
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import Json.Encode
import Knob exposing (Knob)
import Test exposing (Test)


serialize : Test
serialize =
    Test.describe "Serialization"
        [ Test.describe "Floats"
            [ Test.fuzz Fuzz.niceFloat "float" <|
                \float ->
                    Knob.float { step = 0.1, initial = float }
                        |> expectCanSerialize (Json.Encode.float float)
            , Test.fuzz (Fuzz.floatRange -9999 9999) "floatConstrained" <|
                \float ->
                    Knob.floatConstrained { range = ( -9999, 9999 ), step = 0.1, initial = float }
                        |> expectCanSerialize (Json.Encode.float float)
            , Test.fuzz (Fuzz.floatRange -9999 9999) "floatSlider" <|
                \float ->
                    Knob.floatSlider { range = ( -9999, 9999 ), step = 0.1, initial = float }
                        |> expectCanSerialize (Json.Encode.float float)
            ]
        , Test.describe "Ints"
            [ Test.fuzz Fuzz.int "int" <|
                \int ->
                    Knob.int { step = 1, initial = int }
                        |> expectCanSerialize (Json.Encode.int int)
            , Test.fuzz (Fuzz.intRange -1000 1000) "intConstrained" <|
                \int ->
                    Knob.intConstrained { step = 1, range = ( -1000, 1000 ), initial = int }
                        |> expectCanSerialize (Json.Encode.int int)
            , Test.fuzz (Fuzz.intRange -1000 1000) "intSlider" <|
                \int ->
                    Knob.intSlider { step = 1, range = ( -1000, 1000 ), initial = int }
                        |> expectCanSerialize (Json.Encode.int int)
            ]
        , Test.describe "Other"
            [ Test.fuzz Fuzz.bool "boolCheckbox" <|
                \bool ->
                    Knob.boolCheckbox bool
                        |> expectCanSerialize (Json.Encode.bool bool)
            , let
                values =
                    [ ( "a", 1 )
                    , ( "b", 2 )
                    , ( "c", 3 )
                    ]
                        |> Dict.fromList

                toString val =
                    Dict.toList values
                        |> List.filter (\( _, v ) -> v == val)
                        |> List.head
                        |> Maybe.map Tuple.first
                        |> Maybe.withDefault ""

                fromString string =
                    Dict.get string values
                        |> Maybe.withDefault 0
              in
              Test.fuzz (Fuzz.oneOfValues (Dict.values values)) "select" <|
                \value ->
                    Knob.select
                        { options = values |> Dict.keys
                        , toString = toString
                        , fromString = fromString
                        , initial = value
                        }
                        |> expectCanSerialize (Json.Encode.string (toString value))
            , Test.fuzz3 fuzzColorChannel fuzzColorChannel fuzzColorChannel "colorPicker" <|
                \red green blue ->
                    let
                        color =
                            { red = red, green = green, blue = blue }
                    in
                    Knob.colorPicker color
                        |> expectCanSerialize
                            (Json.Encode.object
                                [ ( "red", Json.Encode.float red )
                                , ( "green", Json.Encode.float green )
                                , ( "blue", Json.Encode.float blue )
                                ]
                            )
            ]
        ]


fuzzColorChannel : Fuzzer Float
fuzzColorChannel =
    Fuzz.floatRange 0 1


expectCanSerialize : Json.Encode.Value -> Knob a -> Expectation
expectCanSerialize encodedValue knob =
    knob
        |> Knob.serialize
        |> Json.Encode.encode 0
        |> Expect.equal (encodedValue |> Json.Encode.encode 0)
