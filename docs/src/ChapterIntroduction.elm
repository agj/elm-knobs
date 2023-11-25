module ChapterIntroduction exposing (..)

import ElmBook.Actions
import ElmBook.Chapter exposing (Chapter)
import Html exposing (Html)
import Html.Attributes exposing (class)
import Knob exposing (Knob)


chapter =
    ElmBook.Chapter.chapter "Introduction"
        |> ElmBook.Chapter.withStatefulComponentList
            [ ( "int", componentInt )
            ]
        |> ElmBook.Chapter.render content


content : String
content =
    """
This is the interactive documentation for elm-knobs.

<component with-label="int" />
"""


type alias Model =
    { int : Knob Int }


type alias SharedModel a =
    { a | introduction : Model }


init =
    { int = Knob.int { step = 1, initial = 5 } }


update : Model -> SharedModel a -> SharedModel a
update newModel sharedModel =
    { sharedModel | introduction = newModel }


updateInt : Model -> Knob Int -> Model
updateInt model newInt =
    { model | int = newInt }


componentInt sharedModel =
    knobPreview
        (sharedModel.introduction.int
            |> Knob.view (ElmBook.Actions.updateStateWith (updateInt sharedModel.introduction >> update))
        )
        (Knob.value sharedModel.introduction.int |> String.fromInt)


knobPreview knobView knobValue =
    Html.div [ class "component-preview" ]
        [ knobView
        , Html.div []
            [ Html.text ("Value: " ++ knobValue) ]
        ]
