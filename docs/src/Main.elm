module Main exposing (main)

import ChapterIntroduction
import ChapterNumber
import ChapterOtherTypes
import Constants
import ElmBook exposing (Book)
import ElmBook.Chapter
import ElmBook.StatefulOptions


type alias Model =
    { number : ChapterNumber.Model
    , otherTypes : ChapterOtherTypes.Model
    }


init : Model
init =
    { number = ChapterNumber.init
    , otherTypes = ChapterOtherTypes.init
    }


main : Book Model
main =
    ElmBook.book ("elm-knobs " ++ Constants.elmKnobsVersion)
        |> ElmBook.withStatefulOptions
            [ ElmBook.StatefulOptions.initialState init
            ]
        |> ElmBook.withChapterGroups
            [ ( ""
              , [ ChapterIntroduction.chapter
                , ElmBook.Chapter.chapterLink
                    { title = "API docs ↗"
                    , url = Constants.apiDocsUrl
                    }
                ]
              )
            , ( "Knobs"
              , [ ChapterNumber.chapter
                , ChapterOtherTypes.chapter
                ]
              )
            ]
