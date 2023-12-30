module ChapterComposing exposing (Model, chapter, init)

import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)
import Knob exposing (Knob)
import KnobDoc exposing (KnobDoc)
import String.Extra


chapter =
    ElmBook.Chapter.chapter "Composition"
        |> ElmBook.Chapter.withStatefulComponentList
            [ toComponent composeDoc ]
        |> ElmBook.Chapter.render content


content : String
content =
    """
Composition.

$compose$
"""
        |> String.replace "$compose$" (toTemplate composeDoc)


type alias Model =
    { compose : Knob Float
    }


init =
    { compose = composeDoc.init_
    }



-- Docs


composeDoc =
    { name = "compose"
    , description = "Bla."
    , init_ = Knob.float { step = 1, initial = 1 }
    , code = "Knob.float { step = 1, initial = 1 }"
    , get = \model -> model.compose
    , set = \model knob -> { model | compose = knob }
    , toString = String.fromFloat
    }



-- Utils


toComponent =
    KnobDoc.toComponent
        .composing
        (\model sharedModel -> { sharedModel | composing = model })


toTemplate : { a | name : String, description : String, code : String } -> String
toTemplate { name, description, code } =
    """
## $name$

$description$

<component
    with-label="$name$"
    with-hidden-label="true"
/>

```elm
$code$
```
"""
        |> String.replace "$name$" name
        |> String.replace "$description$" description
        |> String.replace "$code$" (code |> String.Extra.unindent |> String.trim)
