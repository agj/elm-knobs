module KnobTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import Json.Encode
import Knob exposing (Knob)
import Test exposing (Test)


serialize : Test
serialize =
    Test.describe "Serialization"
        [ Test.fuzz Fuzz.int "int" <|
            \int ->
                Knob.int { step = 1, initial = int }
                    |> expectCanSerialize (Json.Encode.int int)
        , Test.fuzz (Fuzz.intRange -1000 1000) "intConstrained" <|
            \int ->
                Knob.intConstrained { step = 1, range = ( -1000, 1000 ), initial = int }
                    |> expectCanSerialize (Json.Encode.int int)
        ]


expectCanSerialize : Json.Encode.Value -> Knob a -> Expectation
expectCanSerialize encodedValue knob =
    knob
        |> Knob.serialize
        |> Json.Encode.encode 0
        |> Expect.equal (encodedValue |> Json.Encode.encode 0)
