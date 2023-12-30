module ChapterComposing exposing (Model, chapter, init)

import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)
import Knob exposing (Knob)
import KnobDoc exposing (KnobDoc)
import String.Extra


chapter =
    ElmBook.Chapter.chapter "Composition & organization"
        |> ElmBook.Chapter.withStatefulComponentList
            [ toComponent labelDoc
            , toComponent composeDoc
            , toComponent stackLabelDoc
            ]
        |> ElmBook.Chapter.render content


content : String
content =
    """
Composition.

$compose$

$label$

$stackLabel$
"""
        |> String.replace "$label$" (toTemplate labelDoc)
        |> String.replace "$compose$" (toTemplate composeDoc)
        |> String.replace "$stackLabel$" (toTemplate stackLabelDoc)


type alias Model =
    { label : Knob Float
    , compose : Knob Compose
    , stackLabel : Knob Compose
    }


init =
    { label = labelDoc.init_
    , compose = composeDoc.init_
    , stackLabel = stackLabelDoc.init_
    }



-- Docs


labelDoc : KnobDoc Float Model
labelDoc =
    { name = "label"
    , init_ =
        Knob.label "Amount"
            (Knob.float { step = 1, initial = 0 })
    , code =
        """
        Knob.label "Amount"
            (Knob.float { step = 1, initial = 0 })
        """
    , get = .label
    , set = \model knob -> { model | label = knob }
    , toString = String.fromFloat
    }


type alias Compose =
    { name : String
    , credits : Float
    }


composeToString compose =
    "{ name = $name$, credits = $float$ }"
        |> String.replace "$name$" compose.name
        |> String.replace "$float$" (String.fromFloat compose.credits)


composeDoc : KnobDoc Compose Model
composeDoc =
    { name = "compose + stack"
    , init_ =
        Knob.compose
            (\name credits ->
                { name = name, credits = credits }
            )
            |> Knob.stack (Knob.stringInput "Ale")
            |> Knob.stack
                (Knob.floatConstrained
                    { step = 1, range = ( 0, 99 ), initial = 10 }
                )
    , code =
        """
        Knob.compose
            (\\name credits ->
                { name = name, credits = credits }
            )
            |> Knob.stack (Knob.stringInput "Ale")
            |> Knob.stack
                (Knob.floatConstrained
                    { step = 1, range = ( 0, 99 ), initial = 10 }
                )
        """
    , get = .compose
    , set = \model knob -> { model | compose = knob }
    , toString = composeToString
    }


stackLabelDoc : KnobDoc Compose Model
stackLabelDoc =
    { name = "compose + stackLabel"
    , init_ =
        Knob.compose
            (\name credits ->
                { name = name, credits = credits }
            )
            |> Knob.stackLabel "Name"
                (Knob.stringInput "Ale")
            |> Knob.stackLabel "Credits"
                (Knob.floatConstrained
                    { step = 1, range = ( 0, 99 ), initial = 10 }
                )
    , code =
        """
        Knob.compose
            (\\name credits ->
                { name = name, credits = credits }
            )
            |> Knob.stackLabel "Name"
                (Knob.stringInput "Ale")
            |> Knob.stackLabel "Credits"
                (Knob.floatConstrained
                    { step = 1, range = ( 0, 99 ), initial = 10 }
                )
        """
    , get = .stackLabel
    , set = \model knob -> { model | stackLabel = knob }
    , toString = composeToString
    }



-- Utils


toComponent =
    KnobDoc.toComponent
        .composing
        (\model sharedModel -> { sharedModel | composing = model })


toTemplate : KnobDoc a model -> String
toTemplate { name, code } =
    """
## $name$

<component
    with-label="$name$"
    with-hidden-label="true"
/>

```elm
$code$
```
"""
        |> String.replace "$name$" name
        |> String.replace "$code$" (code |> String.Extra.unindent |> String.trim)
