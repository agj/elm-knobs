module ChapterNumber exposing (Model, chapter, init)

import Constants
import ElmBook exposing (Msg)
import ElmBook.Actions
import ElmBook.Chapter exposing (Chapter)
import Html exposing (Html)
import Html.Attributes exposing (class)
import Knob exposing (Knob)


chapter =
    ElmBook.Chapter.chapter "Number"
        |> ElmBook.Chapter.withStatefulComponentList
            [ knobDocToComponent floatDoc
            , knobDocToComponent floatConstrainedDoc
            , knobDocToComponent floatSliderDoc
            , knobDocToComponent intDoc
            , knobDocToComponent intConstrainedDoc
            , knobDocToComponent intSliderDoc
            ]
        |> ElmBook.Chapter.render content


content : String
content =
    """
These are all the knobs that manage an `Int` or a `Float` value.

$float$

$floatConstrained$

$floatSlider$

$int$

$intConstrained$

$intSlider$
"""
        |> String.replace "$float$" (knobDocToTemplate floatDoc)
        |> String.replace "$floatConstrained$" (knobDocToTemplate floatConstrainedDoc)
        |> String.replace "$floatSlider$" (knobDocToTemplate floatSliderDoc)
        |> String.replace "$int$" (knobDocToTemplate intDoc)
        |> String.replace "$intConstrained$" (knobDocToTemplate intConstrainedDoc)
        |> String.replace "$intSlider$" (knobDocToTemplate intSliderDoc)


type alias Model =
    { float : Knob Float
    , floatConstrained : Knob Float
    , floatSlider : Knob Float
    , int : Knob Int
    , intConstrained : Knob Int
    , intSlider : Knob Int
    }


type alias SharedModel a =
    { a | number : Model }


init =
    { float = floatDoc.init_
    , floatConstrained = floatConstrainedDoc.init_
    , floatSlider = floatSliderDoc.init_
    , int = intDoc.init_
    , intConstrained = intConstrainedDoc.init_
    , intSlider = intSliderDoc.init_
    }


update : Model -> SharedModel a -> SharedModel a
update newModel sharedModel =
    { sharedModel | number = newModel }



-- Knob docs


type alias KnobDoc a =
    { name : String
    , init_ : Knob a
    , code : String
    , get : Model -> Knob a
    , set : Model -> Knob a -> Model
    , toString : a -> String
    }


floatDoc : KnobDoc Float
floatDoc =
    { name = "float"
    , init_ = Knob.float { step = 0.01, initial = 0 }
    , code = "Knob.float { step = 0.01, initial = 0 }"
    , get = \model -> model.float
    , set = \model new -> { model | float = new }
    , toString = String.fromFloat
    }


floatConstrainedDoc : KnobDoc Float
floatConstrainedDoc =
    { name = "floatConstrained"
    , init_ = Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }
    , code = "Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }"
    , get = \model -> model.floatConstrained
    , set = \model new -> { model | floatConstrained = new }
    , toString = String.fromFloat
    }


floatSliderDoc : KnobDoc Float
floatSliderDoc =
    { name = "floatSlider"
    , init_ = Knob.floatSlider { step = 0.01, range = ( 0, 1 ), initial = 0 }
    , code = "Knob.floatSlider { step = 0.01, range = ( 0, 1 ), initial = 0 }"
    , get = \model -> model.floatSlider
    , set = \model new -> { model | floatSlider = new }
    , toString = String.fromFloat
    }


intDoc : KnobDoc Int
intDoc =
    { name = "int"
    , init_ = Knob.int { step = 1, initial = 0 }
    , code = "Knob.int { step = 1, initial = 0 }"
    , get = \model -> model.int
    , set = \model new -> { model | int = new }
    , toString = String.fromInt
    }


intConstrainedDoc : KnobDoc Int
intConstrainedDoc =
    { name = "intConstrained"
    , init_ = Knob.intConstrained { step = 1, range = ( 0, 10 ), initial = 0 }
    , code = "Knob.intConstrained { step = 1, range = ( 0, 10 ), initial = 0 }"
    , get = \model -> model.intConstrained
    , set = \model new -> { model | intConstrained = new }
    , toString = String.fromInt
    }


intSliderDoc : KnobDoc Int
intSliderDoc =
    { name = "intSlider"
    , init_ = Knob.intSlider { step = 1, range = ( 0, 10 ), initial = 0 }
    , code = "Knob.intSlider { step = 1, range = ( 0, 10 ), initial = 0 }"
    , get = \model -> model.intSlider
    , set = \model new -> { model | intSlider = new }
    , toString = String.fromInt
    }



-- Utilities


knobDocToComponent : KnobDoc a -> ( String, SharedModel x -> Html (Msg (SharedModel x)) )
knobDocToComponent knobDoc =
    let
        knobView : SharedModel x -> Html (Msg (SharedModel x))
        knobView sharedModel =
            Html.div [ class "component-preview" ]
                [ knobDoc.get sharedModel.number
                    |> Knob.view (ElmBook.Actions.updateStateWith (knobDoc.set sharedModel.number >> update))
                , Html.div []
                    [ Html.text ("Value: " ++ (sharedModel.number |> knobDoc.get |> Knob.value |> knobDoc.toString)) ]
                ]
    in
    ( knobDoc.name, knobView )


knobDocToTemplate : KnobDoc a -> String
knobDocToTemplate knobDoc =
    """
## $knobName$

📦 [See it in the package docs.](https://package.elm-lang.org/packages/agj/elm-knobs/$elmKnobsVersion$/Knob#$knobName$)

```elm
$code$
```

<component with-label="$knobName$" />
"""
        |> String.replace "$knobName$" knobDoc.name
        |> String.replace "$code$" knobDoc.code
        |> String.replace "$elmKnobsVersion$" Constants.elmKnobsVersion
