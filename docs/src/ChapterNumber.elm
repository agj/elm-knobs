module ChapterNumber exposing (Model, chapter, init)

import Browser.Dom
import ElmBook exposing (Msg)
import ElmBook.Actions exposing (logAction, updateState, updateStateWithCmd)
import ElmBook.Chapter exposing (Chapter)
import Html
import Html.Events
import Knob exposing (Knob)
import KnobDoc exposing (KnobDoc)
import Task


chapter =
    ElmBook.Chapter.chapter "Number"
        |> ElmBook.Chapter.withStatefulComponentList
            ([ knobDocToComponent floatDoc
             , knobDocToComponent floatConstrainedDoc
             , knobDocToComponent floatSliderDoc
             , knobDocToComponent intDoc
             , knobDocToComponent intConstrainedDoc
             , knobDocToComponent intSliderDoc
             ]
                |> List.concat
            )
        |> ElmBook.Chapter.render content


content : String
content =
    """
These are all the knobs that manage an `Int` or a `Float` value.

- <component with-label="toc-link-float" with-display="inline" />
- <component with-label="toc-link-floatConstrained" with-display="inline" />
- <component with-label="toc-link-floatSlider" with-display="inline" />

$float$

$floatConstrained$

$floatSlider$

$int$

$intConstrained$

$intSlider$
"""
        |> String.replace "$float$" (KnobDoc.toTemplate floatDoc)
        |> String.replace "$floatConstrained$" (KnobDoc.toTemplate floatConstrainedDoc)
        |> String.replace "$floatSlider$" (KnobDoc.toTemplate floatSliderDoc)
        |> String.replace "$int$" (KnobDoc.toTemplate intDoc)
        |> String.replace "$intConstrained$" (KnobDoc.toTemplate intConstrainedDoc)
        |> String.replace "$intSlider$" (KnobDoc.toTemplate intSliderDoc)


type alias Model =
    { float : Knob Float
    , floatConstrained : Knob Float
    , floatSlider : Knob Float
    , int : Knob Int
    , intConstrained : Knob Int
    , intSlider : Knob Int
    }


init =
    { float = floatDoc.init_
    , floatConstrained = floatConstrainedDoc.init_
    , floatSlider = floatSliderDoc.init_
    , int = intDoc.init_
    , intConstrained = intConstrainedDoc.init_
    , intSlider = intSliderDoc.init_
    }


knobDocToComponent =
    KnobDoc.toComponentWithId
        (\sharedModel -> sharedModel.number)
        (\model sharedModel -> { sharedModel | number = model })



-- Knob docs


floatDoc : KnobDoc Float Model
floatDoc =
    { name = "float"
    , init_ = Knob.float { step = 0.01, initial = 0 }
    , code = "Knob.float { step = 0.01, initial = 0 }"
    , get = \model -> model.float
    , set = \model new -> { model | float = new }
    , toString = String.fromFloat
    }


floatConstrainedDoc : KnobDoc Float Model
floatConstrainedDoc =
    { name = "floatConstrained"
    , init_ = Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }
    , code = "Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }"
    , get = \model -> model.floatConstrained
    , set = \model new -> { model | floatConstrained = new }
    , toString = String.fromFloat
    }


floatSliderDoc : KnobDoc Float Model
floatSliderDoc =
    { name = "floatSlider"
    , init_ = Knob.floatSlider { step = 0.01, range = ( 0, 1 ), initial = 0 }
    , code = "Knob.floatSlider { step = 0.01, range = ( 0, 1 ), initial = 0 }"
    , get = \model -> model.floatSlider
    , set = \model new -> { model | floatSlider = new }
    , toString = String.fromFloat
    }


intDoc : KnobDoc Int Model
intDoc =
    { name = "int"
    , init_ = Knob.int { step = 1, initial = 0 }
    , code = "Knob.int { step = 1, initial = 0 }"
    , get = \model -> model.int
    , set = \model new -> { model | int = new }
    , toString = String.fromInt
    }


intConstrainedDoc : KnobDoc Int Model
intConstrainedDoc =
    { name = "intConstrained"
    , init_ = Knob.intConstrained { step = 1, range = ( 0, 10 ), initial = 0 }
    , code = "Knob.intConstrained { step = 1, range = ( 0, 10 ), initial = 0 }"
    , get = \model -> model.intConstrained
    , set = \model new -> { model | intConstrained = new }
    , toString = String.fromInt
    }


intSliderDoc : KnobDoc Int Model
intSliderDoc =
    { name = "intSlider"
    , init_ = Knob.intSlider { step = 1, range = ( 0, 10 ), initial = 0 }
    , code = "Knob.intSlider { step = 1, range = ( 0, 10 ), initial = 0 }"
    , get = \model -> model.intSlider
    , set = \model new -> { model | intSlider = new }
    , toString = String.fromInt
    }
