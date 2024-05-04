module ChaptersFull exposing (chapters)

import Constants
import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)
import Html
import Html.Attributes


chapters : List (Chapter x)
chapters =
    [ { name = "Basic"
      , slug = "basic"
      , height = "7em"
      }
    , { name = "Polygon"
      , slug = "polygon"
      , height = "500px"
      }
    , { name = "Web Storage API"
      , slug = "web-storage"
      , height = "13em"
      }
    ]
        |> List.map toChapter


type alias Desc =
    { name : String
    , slug : String
    , height : String
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

        linkNewTab url label =
            Html.a
                [ Html.Attributes.target "blank_"
                , Html.Attributes.href url
                ]
                [ Html.text label ]
    in
    ElmBook.Chapter.chapter desc.name
        |> ElmBook.Chapter.withComponentList
            [ ( "iframe"
              , Html.iframe
                    [ Html.Attributes.src exampleUrl
                    , Html.Attributes.class "full-example"
                    , Html.Attributes.style "height" desc.height
                    ]
                    []
              )
            , ( "link-source"
              , linkNewTab sourceUrl "Source code on Github. ↗"
              )
            , ( "link-full-page"
              , linkNewTab exampleUrl "Open on its own. ↗"
              )
            ]
        |> ElmBook.Chapter.render content


contentTemplate =
    """
- <component with-label="link-source" with-display="inline" />
- <component with-label="link-full-page" with-display="inline" />

<component
    with-label="iframe"
    with-hidden-label="true"
/>
"""
