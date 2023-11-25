module ChapterIntroduction exposing (..)

import ElmBook exposing (Msg)
import ElmBook.Actions
import ElmBook.Chapter exposing (Chapter)
import Html exposing (Html)
import Html.Attributes exposing (class)
import Knob exposing (Knob)


chapter =
    ElmBook.Chapter.chapter "Introduction"
        |> ElmBook.Chapter.withStatefulComponentList
            [ knobDocToComponent floatDoc
            , knobDocToComponent floatConstrainedDoc
            , knobDocToComponent intDoc
            ]
        |> ElmBook.Chapter.render content


content : String
content =
    """
This is the interactive documentation for elm-knobs.

$FLOAT$

$FLOAT_CONSTRAINED$

$INT$
"""
        |> String.replace "$FLOAT$" (knobDocToTemplate floatDoc)
        |> String.replace "$FLOAT_CONSTRAINED$" (knobDocToTemplate floatConstrainedDoc)
        |> String.replace "$INT$" (knobDocToTemplate intDoc)


type alias Model =
    { float : Knob Float
    , floatConstrained : Knob Float
    , int : Knob Int
    }


type alias SharedModel a =
    { a | introduction : Model }


type alias KnobDoc a =
    { name : String
    , init : Knob a
    , code : String
    , get : Model -> Knob a
    , set : Model -> Knob a -> Model
    , toString : a -> String
    }


init =
    { float = floatDoc.init
    , floatConstrained = floatConstrainedDoc.init
    , int = intDoc.init
    }


update : Model -> SharedModel a -> SharedModel a
update newModel sharedModel =
    { sharedModel | introduction = newModel }



-- float


floatDoc : KnobDoc Float
floatDoc =
    { name = "float"
    , init = Knob.float { step = 0.01, initial = 0 }
    , code = "Knob.float { step = 0.01, initial = 0 }"
    , get = \model -> model.float
    , set = \model new -> { model | float = new }
    , toString = String.fromFloat
    }



-- floatConstrained


floatConstrainedDoc : KnobDoc Float
floatConstrainedDoc =
    { name = "floatConstrained"
    , init = Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }
    , code = "Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }"
    , get = \model -> model.floatConstrained
    , set = \model new -> { model | floatConstrained = new }
    , toString = String.fromFloat
    }



-- int


intDoc : KnobDoc Int
intDoc =
    { name = "int"
    , init = Knob.int { step = 1, initial = 0 }
    , code = "Knob.int { step = 1, initial = 0 }"
    , get = \model -> model.int
    , set = \model new -> { model | int = new }
    , toString = String.fromInt
    }



-- Utilities


knobDocToComponent : KnobDoc a -> ( String, SharedModel x -> Html (Msg (SharedModel x)) )
knobDocToComponent knobDoc =
    let
        knobView : SharedModel x -> Html (Msg (SharedModel x))
        knobView sharedModel =
            Html.div [ class "component-preview" ]
                [ knobDoc.get sharedModel.introduction
                    |> Knob.view (ElmBook.Actions.updateStateWith (knobDoc.set sharedModel.introduction >> update))
                , Html.div []
                    [ Html.text ("Value: " ++ (sharedModel.introduction |> knobDoc.get |> Knob.value |> knobDoc.toString)) ]
                ]
    in
    ( knobDoc.name, knobView )


knobDocToTemplate : KnobDoc a -> String
knobDocToTemplate knobDoc =
    """
## KNOB_NAME

```elm
CODE
```

<component with-label="KNOB_NAME" />
"""
        |> String.replace "KNOB_NAME" knobDoc.name
        |> String.replace "CODE" knobDoc.code
