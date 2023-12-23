module Internal.Utils exposing (..)

import Hex


type alias Color =
    { red : Float
    , green : Float
    , blue : Float
    }


colorFromString : Color -> String -> Color
colorFromString default colorString =
    case String.uncons colorString of
        Just ( '#', rest ) ->
            let
                parse : String -> Float
                parse str =
                    str
                        |> Hex.fromString
                        |> Result.withDefault 0
                        |> (\n -> toFloat n / 255)
            in
            { red =
                rest
                    |> String.left 2
                    |> parse
            , green =
                rest
                    |> String.dropLeft 2
                    |> String.left 2
                    |> parse
            , blue =
                rest
                    |> String.dropLeft 4
                    |> String.left 2
                    |> parse
            }

        _ ->
            default


colorToString : Color -> String
colorToString color =
    let
        { red, green, blue } =
            color

        toHex : Float -> String
        toHex num =
            floor (num * 255)
                |> Hex.toString
                |> String.padLeft 2 '0'

        colorHex : String
        colorHex =
            toHex red ++ toHex green ++ toHex blue
    in
    "#" ++ colorHex
