module Main exposing (main)

import ChapterIntroduction
import ElmBook exposing (Book)


main : Book ()
main =
    ElmBook.book "elm-knobs"
        |> ElmBook.withChapters
            [ ChapterIntroduction.chapter
            ]
