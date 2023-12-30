module ChapterComposing exposing (Model, chapter, init)

import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)
import Knob exposing (Knob)
import KnobDoc exposing (KnobDoc)


chapter =
    ElmBook.Chapter.chapter "Composition"
        |> ElmBook.Chapter.withStatefulComponentList
            [ composeComponent ]
        |> ElmBook.Chapter.render content


content : String
content =
    """
Composition.

<component with-label="compose" />
"""


type alias Model =
    { compose : Knob Float
    }


init =
    { compose = Knob.float { step = 1, initial = 1 }
    }



-- Components


composeComponent =
    KnobDoc.toComponent
        .composing
        (\model sharedModel -> { sharedModel | composing = model })
        { name = "compose"
        , get = \model -> model.compose
        , set = \model knob -> { model | compose = knob }
        , toString = String.fromFloat
        }
