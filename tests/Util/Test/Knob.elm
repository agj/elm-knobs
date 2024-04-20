module Util.Test.Knob exposing (..)

import Knob exposing (Knob)



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
