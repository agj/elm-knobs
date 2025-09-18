module ChapterTransformation exposing (Model, chapter, init)

import ElmBook.Chapter
import Html exposing (Html)
import Html.Events
import Json.Decode
import Json.Encode
import Knob exposing (Knob)
import KnobDoc exposing (KnobDoc)


chapter =
    ElmBook.Chapter.chapter "Transformation & custom"
        |> ElmBook.Chapter.withStatefulComponentList
            (processedDocs |> List.map .component)
        |> ElmBook.Chapter.render content


content : String
content =
    """
Examples of what you can do to get more customized behaviour out of your knobs.

$knobDocs$
"""
        |> String.replace "$knobDocs$" (KnobDoc.toFullTemplate processedDocs)


type alias Model =
    { map : Knob String
    , custom : Knob String
    }


init : Model
init =
    { map = mapDoc.init_
    , custom = customDoc.init_
    }


processedDocs =
    [ processDoc mapDoc
    , processDoc customDoc
    ]



-- Docs


mapDoc : KnobDoc String Model
mapDoc =
    { name = "map"
    , link = Nothing
    , description = Just """
        Using `map` to add a `$` sign in front of the number.
        The resulting knob is not of type `Knob Int`, but rather `Knob String`.
        """
    , init_ =
        Knob.int { step = 10, initial = 0 }
            |> Knob.map (\int -> "$" ++ String.fromInt int)
    , code =
        """
        Knob.int { step = 10, initial = 0 }
            |> Knob.map (\\int -> "$" ++ String.fromInt int)
        """
    , get = .map
    , set = \model knob -> { model | map = knob }
    , toString = KnobDoc.string
    }


customDoc : KnobDoc String Model
customDoc =
    { name = "custom"
    , link = Nothing
    , description = Just """
        A custom knob consisting of three buttons which each emits a different
        string value.

        We're making a serializable knob here, but notice that it's an optional
        feature, so feel free to ignore that part and use `serialization =
        Nothing`.
        """
    , init_ =
        let
            -- Defining the custom knob.
            abcKnob : String -> Knob String
            abcKnob initial =
                let
                    view : () -> Html (Knob String)
                    view () =
                        Html.div []
                            [ Html.button
                                [ Html.Events.onClick (abcKnob "A") ]
                                [ Html.text "Set A" ]
                            , Html.button
                                [ Html.Events.onClick (abcKnob "B") ]
                                [ Html.text "Set B" ]
                            , Html.button
                                [ Html.Events.onClick (abcKnob "C") ]
                                [ Html.text "Set C" ]
                            ]

                    serialization =
                        { encode = \() -> Json.Encode.string initial
                        , decoder = Json.Decode.map abcKnob Json.Decode.string
                        }
                in
                Knob.custom
                    { value = initial
                    , view = view
                    , serialization = Just serialization
                    }
        in
        -- Using the custom knob.
        abcKnob "A"
    , code =
        """
        let
            -- Defining the custom knob.
            abcKnob : String -> Knob String
            abcKnob initial =
                let
                    view : () -> Html (Knob String)
                    view () =
                        Html.div []
                            [ Html.button
                                [ Html.Events.onClick (abcKnob "A") ]
                                [ Html.text "Set A" ]
                            , Html.button
                                [ Html.Events.onClick (abcKnob "B") ]
                                [ Html.text "Set B" ]
                            , Html.button
                                [ Html.Events.onClick (abcKnob "C") ]
                                [ Html.text "Set C" ]
                            ]

                    serialization =
                        { encode = \\() -> Json.Encode.string initial
                        , decoder = Json.Decode.map abcKnob Json.Decode.string
                        }
                in
                Knob.custom
                    { value = initial
                    , view = view
                    , serialization = Just serialization
                    }
        in
        -- Using the custom knob.
        abcKnob "A"
        """
    , get = .custom
    , set = \model knob -> { model | custom = knob }
    , toString = KnobDoc.string
    }



-- Utils


processDoc =
    KnobDoc.process
        .transformation
        (\model sharedModel -> { sharedModel | transformation = model })
