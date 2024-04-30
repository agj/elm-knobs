module ChaptersFull exposing (chapters)

import Constants
import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)
import Html
import Html.Attributes


chapters =
    [ { name = "Basic"
      , slug = "basic"
      , heightEm = 25
      }
    , { name = "Polygon"
      , slug = "polygon"
      , heightEm = 25
      }
    , { name = "Web Storage API"
      , slug = "web-storage"
      , heightEm = 25
      }
    ]
        |> List.map toChapter


type alias Desc =
    { name : String
    , slug : String
    , heightEm : Int
    }


toChapter : Desc -> Chapter x
toChapter desc =
    let
        exampleUrl =
            "./examples/%slug%"
                |> String.replace "%slug%" desc.slug

        sourceUrl =
            "%githubUrl%/examples/$slug$/"
                |> String.replace "%githubUrl%" Constants.githubVersionUrl
                |> String.replace "$slug$" desc.slug

        content =
            contentTemplate
                |> String.replace "$exampleUrl$" exampleUrl
                |> String.replace "$sourceUrl$" sourceUrl
    in
    ElmBook.Chapter.chapter desc.name
        |> ElmBook.Chapter.withComponentList
            [ ( "iframe"
              , Html.iframe
                    [ Html.Attributes.src exampleUrl
                    , Html.Attributes.class "full-example"
                    , Html.Attributes.style "height" "25em"
                    ]
                    []
              )
            ]
        |> ElmBook.Chapter.render content


contentTemplate =
    """
- [Source code on Github]($sourceUrl$)
- [Open full-screen]($exampleUrl$)

<component
    with-label="iframe"
    with-hidden-label="true"
/>
"""
