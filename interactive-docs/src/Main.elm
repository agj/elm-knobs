module Main exposing (main)

import ChapterComposing
import ChapterIntroduction
import ChapterMap
import ChapterNumber
import ChapterOtherTypes
import Constants
import ElmBook exposing (Book)
import ElmBook.Chapter
import ElmBook.StatefulOptions
import ElmBook.ThemeOptions
import Html
import Html.Attributes
import Knob


type alias Model =
    { number : ChapterNumber.Model
    , otherTypes : ChapterOtherTypes.Model
    , composing : ChapterComposing.Model
    , transformation : ChapterMap.Model
    }


init : Model
init =
    { number = ChapterNumber.init
    , otherTypes = ChapterOtherTypes.init
    , composing = ChapterComposing.init
    , transformation = ChapterMap.init
    }


main : Book Model
main =
    ElmBook.book ("elm-knobs " ++ Constants.elmKnobsVersion)
        |> ElmBook.withThemeOptions
            [ ElmBook.ThemeOptions.subtitle "interactive docs"
            , ElmBook.ThemeOptions.logo
                (Html.div [ Html.Attributes.class "page-logo" ]
                    [ Html.text "🎛"
                    , Knob.styles
                    ]
                )
            , ElmBook.ThemeOptions.useHashBasedNavigation
            ]
        |> ElmBook.withStatefulOptions
            [ ElmBook.StatefulOptions.initialState init ]
        |> ElmBook.withChapterGroups
            [ ( ""
              , [ ChapterIntroduction.chapter
                , ElmBook.Chapter.chapterLink
                    { title = "API docs ↗"
                    , url = Constants.apiDocsUrl
                    }
                , ElmBook.Chapter.chapterLink
                    { title = "Other versions ↗"
                    , url = "../"
                    }
                ]
              )
            , ( "Knob examples"
              , [ ChapterNumber.chapter
                , ChapterOtherTypes.chapter
                , ChapterComposing.chapter
                , ChapterMap.chapter
                ]
              )
            ]
