module ChapterIntroduction exposing (..)

import ElmBook.Actions
import ElmBook.Chapter exposing (Chapter)
import Html exposing (Html)
import Knob exposing (Knob)


chapter =
    ElmBook.Chapter.chapter "Introduction"
        |> ElmBook.Chapter.withStatefulComponentList
            [ ( "Bla", componentInt )
            ]
        |> ElmBook.Chapter.render content


content : String
content =
    """
This is the interactive documentation for elm-knobs.

<component with-label="Bla" />
"""


type alias Model =
    Knob Int


type alias SharedModel a =
    { a | introduction : Model }


init =
    Knob.int { step = 1, initial = 5 }


update : Model -> SharedModel a -> SharedModel a
update newModel sharedModel =
    { sharedModel | introduction = newModel }



-- componentInt : SharedModel a -> Html (SharedModel a)


componentInt model =
    model.introduction
        |> Knob.view (ElmBook.Actions.updateStateWith update)
