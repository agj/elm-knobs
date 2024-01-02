module Constants exposing (..)


elmKnobsVersion =
    "1.1.0"


apiDocsUrl =
    "https://package.elm-lang.org/packages/agj/elm-knobs/$version$"
        |> String.replace "$version$" elmKnobsVersion
