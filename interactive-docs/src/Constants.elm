module Constants exposing (..)


elmKnobsVersion : String
elmKnobsVersion =
    "2.0.0"


apiDocsUrl : String
apiDocsUrl =
    "https://package.elm-lang.org/packages/agj/elm-knobs/$version$"
        |> String.replace "$version$" elmKnobsVersion


githubVersionUrl : String
githubVersionUrl =
    "https://github.com/agj/elm-knobs/tree/$version$"
        |> String.replace "$version$" elmKnobsVersion
