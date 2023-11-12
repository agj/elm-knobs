module Main exposing (main)

import ChapterIntroduction
import ElmBook exposing (Book)
import ElmBook.StatefulOptions


type alias Model =
    { introduction : ChapterIntroduction.Model
    }


init : Model
init =
    { introduction = ChapterIntroduction.init
    }


main : Book Model
main =
    ElmBook.book "elm-knobs"
        |> ElmBook.withStatefulOptions
            [ ElmBook.StatefulOptions.initialState init
            ]
        |> ElmBook.withChapters
            [ ChapterIntroduction.chapter
            ]
