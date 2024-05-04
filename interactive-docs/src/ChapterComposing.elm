module ChapterComposing exposing (Model, chapter, init)

import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)
import Knob exposing (Knob)
import KnobDoc exposing (KnobDoc)


chapter =
    ElmBook.Chapter.chapter "Composition & organization"
        |> ElmBook.Chapter.withStatefulComponentList
            (processedDocs |> List.map .component)
        |> ElmBook.Chapter.render content


content : String
content =
    """
Examples of composing multiple knobs into a bigger data structure.

$knobDocs$
"""
        |> String.replace "$knobDocs$" (KnobDoc.toFullTemplate processedDocs)


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


processedDocs =
    [ processDoc composeDoc
    , processDoc labelDoc
    , processDoc stackLabelDoc
    ]



-- Docs


type alias Compose =
    { name : String
    , credits : Float
    }


composeToString compose =
    """{ name = "$name$", credits = $float$ }"""
        |> String.replace "$name$" compose.name
        |> String.replace "$float$" (String.fromFloat compose.credits)


composeDoc : KnobDoc Compose Model
composeDoc =
    { name = "compose + stack"
    , link = Just [ "compose", "stack" ]
    , description = Nothing
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


labelDoc : KnobDoc Float Model
labelDoc =
    { name = "label"
    , link = Nothing
    , description = Nothing
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


stackLabelDoc : KnobDoc Compose Model
stackLabelDoc =
    { name = "compose + stackLabel"
    , link = Just [ "compose", "stackLabel" ]
    , description = Nothing
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


processDoc =
    KnobDoc.process
        .composing
        (\model sharedModel -> { sharedModel | composing = model })
