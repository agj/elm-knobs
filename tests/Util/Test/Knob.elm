module Util.Test.Knob exposing (Vegetable, fuzzColor, fuzzColorChannel, knobSelect, vegetableStrings, vegetables)

import Fuzz exposing (Fuzzer)
import Knob exposing (Knob)



-- KNOB PRODUCTION


knobSelect :
    Vegetable
    -> Vegetable
    ->
        { knob : Knob Vegetable
        , fromString : String -> Vegetable
        , toString : Vegetable -> String
        }
knobSelect default initial =
    { knob =
        Knob.select
            { options = vegetableStrings
            , toString = vegetableToString
            , fromString = vegetableFromString >> Maybe.withDefault default
            , initial = initial
            }
    , fromString = vegetableFromString >> Maybe.withDefault default
    , toString = vegetableToString
    }


type Vegetable
    = Carrot
    | Lettuce
    | Beet



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



-- INTERNAL


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


vegetableFromString : String -> Maybe Vegetable
vegetableFromString string =
    case string of
        "Carrot" ->
            Just Carrot

        "Lettuce" ->
            Just Lettuce

        "Beet" ->
            Just Beet

        _ ->
            Nothing
