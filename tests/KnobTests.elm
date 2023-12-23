module KnobTests exposing (..)

import Dict
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
            , Test.fuzz2 (Fuzz.oneOfValues knobSelectValues) (Fuzz.oneOfValues knobSelectValues) "select" <|
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


deserialize : Test
deserialize =
    Test.describe "Deserialization"
        [ Test.describe "Floats"
            [ Test.fuzz Fuzz.niceFloat "float" <|
                \float ->
                    Knob.float { step = 1, initial = 1 }
                        |> expectViewFloatValueMatchesAfterDeserialization
                            { initial = 1
                            , toSerialize = float
                            }
            , Test.fuzz (Fuzz.floatRange -9999 9999) "floatConstrained" <|
                \float ->
                    Knob.floatConstrained { step = 1, range = ( -9999, 9999 ), initial = 1 }
                        |> expectViewFloatValueMatchesAfterDeserialization
                            { initial = 1
                            , toSerialize = float
                            }
            , Test.fuzz (Fuzz.floatRange -9999 9999) "floatSlider" <|
                \float ->
                    Knob.floatSlider { step = 1, range = ( -9999, 9999 ), initial = 1 }
                        |> expectViewFloatValueMatchesAfterDeserialization
                            { initial = 1
                            , toSerialize = float
                            }
            ]
        , Test.describe "Ints"
            [ Test.fuzz Fuzz.int "int" <|
                \int ->
                    Knob.int { step = 1, initial = 1 }
                        |> expectViewIntValueMatchesAfterDeserialization
                            { initial = 1
                            , toSerialize = int
                            }
            , Test.fuzz (Fuzz.intRange -9999 9999) "intConstrained" <|
                \int ->
                    Knob.intConstrained { step = 1, range = ( -9999, 9999 ), initial = 1 }
                        |> expectViewIntValueMatchesAfterDeserialization
                            { initial = 1
                            , toSerialize = int
                            }
            , Test.fuzz (Fuzz.intRange -9999 9999) "intSlider" <|
                \int ->
                    Knob.intSlider { step = 1, range = ( -9999, 9999 ), initial = 1 }
                        |> expectViewIntValueMatchesAfterDeserialization
                            { initial = 1
                            , toSerialize = int
                            }
            ]
        , Test.describe "Other"
            [ Test.fuzz Fuzz.bool "boolCheckbox" <|
                \bool ->
                    Knob.boolCheckbox True
                        |> Expect.all
                            [ expectViewChecked True
                            , Knob.deserialize (Json.Encode.bool bool)
                                >> expectViewChecked bool
                            ]
            , Test.fuzz (Fuzz.oneOfValues knobSelectValues) "select" <|
                \value ->
                    knobSelect 1
                        |> Knob.view (always ())
                        |> Query.fromHtml
                        |> Query.find [ Selector.selected True ]
                        |> Query.has [ Selector.attribute (Html.Attributes.value "a") ]

            -- |> expectViewValueMatchesAfterDeserialization
            --     Json.Encode.int
            --     knobSelectToString
            --     { initial = 1
            --     , toSerialize = value
            --     }
            ]
        ]



-- KNOB PRODUCTION


knobSelectPairs =
    [ ( "a", 1 )
    , ( "b", 2 )
    , ( "c", 3 )
    ]
        |> Dict.fromList


knobSelectValues =
    Dict.values knobSelectPairs


knobSelectToString val =
    Dict.toList knobSelectPairs
        |> List.filter (\( _, v ) -> v == val)
        |> List.head
        |> Maybe.map Tuple.first
        |> Maybe.withDefault ""


knobSelectFromString string =
    Dict.get string knobSelectPairs
        |> Maybe.withDefault 0


knobSelect : Int -> Knob Int
knobSelect initial =
    Knob.select
        { options = knobSelectPairs |> Dict.keys
        , toString = knobSelectToString
        , fromString = knobSelectFromString
        , initial = initial
        }



-- EXPECTATIONS


expectTransitiveEquality : a -> Knob a -> a -> Knob a -> Expectation
expectTransitiveEquality value1 knob1 value2 knob2 =
    (Knob.serialize knob1 == Knob.serialize knob2)
        |> Expect.equal (value1 == value2)


expectViewHasValue : String -> Knob a -> Expectation
expectViewHasValue valueAsString knob =
    knob
        |> Knob.view (always ())
        |> Query.fromHtml
        |> Query.find [ Selector.tag "input" ]
        |> Query.has [ Selector.attribute (Html.Attributes.value valueAsString) ]


expectViewDoesNotHaveValue : String -> Knob a -> Expectation
expectViewDoesNotHaveValue valueAsString knob =
    knob
        |> Knob.view (always ())
        |> Query.fromHtml
        |> Query.find [ Selector.tag "input" ]
        |> Query.hasNot [ Selector.attribute (Html.Attributes.value valueAsString) ]


expectViewChecked : Bool -> Knob Bool -> Expectation
expectViewChecked checked knob =
    knob
        |> Knob.view (always ())
        |> Query.fromHtml
        |> Query.find [ Selector.tag "input" ]
        |> Query.has [ Selector.attribute (Html.Attributes.checked checked) ]


expectViewValueMatchesAfterDeserialization :
    (a -> Json.Encode.Value)
    -> (a -> String)
    -> { initial : a, toSerialize : a }
    -> Knob a
    -> Expectation
expectViewValueMatchesAfterDeserialization encoder toString { initial, toSerialize } =
    let
        initialAsString =
            toString initial

        toSerializeAsString =
            toString toSerialize

        serialized =
            encoder toSerialize
    in
    Expect.all
        [ -- Sanity check, knob view should have the initial value.
          expectViewHasValue initialAsString

        -- After deserialization, knob should have the serialized value.
        , Knob.deserialize serialized
            >> expectViewHasValue toSerializeAsString

        -- If the values are not the same, the views should have different values.
        , if initial /= toSerialize then
            Expect.all
                [ expectViewDoesNotHaveValue toSerializeAsString
                , Knob.deserialize serialized
                    >> expectViewDoesNotHaveValue initialAsString
                ]

          else
            \_ -> Expect.pass
        ]


expectViewFloatValueMatchesAfterDeserialization =
    expectViewValueMatchesAfterDeserialization Json.Encode.float String.fromFloat


expectViewIntValueMatchesAfterDeserialization =
    expectViewValueMatchesAfterDeserialization Json.Encode.int String.fromInt



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
