module Main exposing (main)

import ChapterIntroduction
import ChapterNumber
import Constants
import ElmBook exposing (Book)
import ElmBook.StatefulOptions


type alias Model =
    { number : ChapterNumber.Model
    }


init : Model
init =
    { number = ChapterNumber.init
    }


main : Book Model
main =
    ElmBook.book ("elm-knobs " ++ Constants.elmKnobsVersion)
        |> ElmBook.withStatefulOptions
            [ ElmBook.StatefulOptions.initialState init
            ]
        |> ElmBook.withChapterGroups
            [ ( ""
              , [ ChapterIntroduction.chapter ]
              )
            , ( "Knobs"
              , [ ChapterNumber.chapter ]
              )
            ]
