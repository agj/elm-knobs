module ChapterNumber exposing (Model, chapter, init)

import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)
import Knob exposing (Knob)
import KnobDoc exposing (KnobDoc)


chapter =
    ElmBook.Chapter.chapter "Number"
        |> ElmBook.Chapter.withStatefulComponentList
            (processedDocs |> List.map .component)
        |> ElmBook.Chapter.render content


content : String
content =
    """
These are all the knobs that manage an `Int` or a `Float` value.

$knobDocs$
"""
        |> String.replace "$knobDocs$" (KnobDoc.toFullTemplate processedDocs)


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


processedDocs =
    [ processDoc floatDoc
    , processDoc floatConstrainedDoc
    , processDoc floatSliderDoc
    , processDoc intDoc
    , processDoc intConstrainedDoc
    , processDoc intSliderDoc
    ]



-- Knob docs


floatDoc : KnobDoc Float Model
floatDoc =
    { name = "float"
    , link = Nothing
    , init_ = Knob.float { step = 0.01, initial = 0 }
    , code = "Knob.float { step = 0.01, initial = 0 }"
    , get = \model -> model.float
    , set = \model new -> { model | float = new }
    , toString = String.fromFloat
    }


floatConstrainedDoc : KnobDoc Float Model
floatConstrainedDoc =
    { name = "floatConstrained"
    , link = Nothing
    , init_ = Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }
    , code = "Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }"
    , get = \model -> model.floatConstrained
    , set = \model new -> { model | floatConstrained = new }
    , toString = String.fromFloat
    }


floatSliderDoc : KnobDoc Float Model
floatSliderDoc =
    { name = "floatSlider"
    , link = Nothing
    , init_ = Knob.floatSlider { step = 0.01, range = ( 0, 1 ), initial = 0 }
    , code = "Knob.floatSlider { step = 0.01, range = ( 0, 1 ), initial = 0 }"
    , get = \model -> model.floatSlider
    , set = \model new -> { model | floatSlider = new }
    , toString = String.fromFloat
    }


intDoc : KnobDoc Int Model
intDoc =
    { name = "int"
    , link = Nothing
    , init_ = Knob.int { step = 1, initial = 0 }
    , code = "Knob.int { step = 1, initial = 0 }"
    , get = \model -> model.int
    , set = \model new -> { model | int = new }
    , toString = String.fromInt
    }


intConstrainedDoc : KnobDoc Int Model
intConstrainedDoc =
    { name = "intConstrained"
    , link = Nothing
    , init_ = Knob.intConstrained { step = 1, range = ( 0, 10 ), initial = 0 }
    , code = "Knob.intConstrained { step = 1, range = ( 0, 10 ), initial = 0 }"
    , get = \model -> model.intConstrained
    , set = \model new -> { model | intConstrained = new }
    , toString = String.fromInt
    }


intSliderDoc : KnobDoc Int Model
intSliderDoc =
    { name = "intSlider"
    , link = Nothing
    , init_ = Knob.intSlider { step = 1, range = ( 0, 10 ), initial = 0 }
    , code = "Knob.intSlider { step = 1, range = ( 0, 10 ), initial = 0 }"
    , get = \model -> model.intSlider
    , set = \model new -> { model | intSlider = new }
    , toString = String.fromInt
    }



-- Utils


processDoc =
    KnobDoc.process
        .number
        (\model sharedModel -> { sharedModel | number = model })
