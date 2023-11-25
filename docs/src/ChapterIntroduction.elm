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


type alias KnobDoc a x =
    { name : String
    , init : Knob a
    , code : String
    , update : Model -> Knob a -> Model
    , view : SharedModel x -> Html (Msg (SharedModel x))
    , valueAsString : SharedModel x -> String
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


floatDoc : KnobDoc Float x
floatDoc =
    { name = "float"
    , init = Knob.float { step = 0.01, initial = 0 }
    , code = "Knob.float { step = 0.01, initial = 0 }"
    , update = floatUpdate
    , view = floatView
    , valueAsString = \sharedModel -> Knob.value sharedModel.introduction.float |> String.fromFloat
    }


floatUpdate : Model -> Knob Float -> Model
floatUpdate model newFloat =
    { model | float = newFloat }


floatView : SharedModel x -> Html (Msg (SharedModel x))
floatView sharedModel =
    sharedModel.introduction.float
        |> Knob.view (ElmBook.Actions.updateStateWith (floatUpdate sharedModel.introduction >> update))



-- floatConstrained


floatConstrainedDoc : KnobDoc Float x
floatConstrainedDoc =
    { name = "floatConstrained"
    , init = Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }
    , code = "Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }"
    , update = floatConstrainedUpdate
    , view = floatConstrainedView
    , valueAsString = \sharedModel -> Knob.value sharedModel.introduction.floatConstrained |> String.fromFloat
    }


floatConstrainedUpdate : Model -> Knob Float -> Model
floatConstrainedUpdate model newFloatConstrained =
    { model | floatConstrained = newFloatConstrained }


floatConstrainedView : SharedModel a -> Html (Msg (SharedModel a))
floatConstrainedView sharedModel =
    sharedModel.introduction.floatConstrained
        |> Knob.view (ElmBook.Actions.updateStateWith (floatConstrainedUpdate sharedModel.introduction >> update))



-- int


intDoc : KnobDoc Int x
intDoc =
    { name = "int"
    , init = Knob.int { step = 1, initial = 0 }
    , code = "Knob.int { step = 1, initial = 0 }"
    , update = intUpdate
    , view = intView
    , valueAsString = \sharedModel -> Knob.value sharedModel.introduction.int |> String.fromInt
    }


intUpdate : Model -> Knob Int -> Model
intUpdate model newInt =
    { model | int = newInt }


intView : SharedModel a -> Html (Msg (SharedModel a))
intView sharedModel =
    sharedModel.introduction.int
        |> Knob.view (ElmBook.Actions.updateStateWith (intUpdate sharedModel.introduction >> update))



-- Utilities


knobPreview : Html a -> String -> Html a
knobPreview knobView knobValue =
    Html.div [ class "component-preview" ]
        [ knobView
        , Html.div []
            [ Html.text ("Value: " ++ knobValue) ]
        ]


knobCodeToTemplate : String -> String -> String
knobCodeToTemplate knobName code =
    """
## KNOB_NAME

```elm
CODE
```

<component with-label="KNOB_NAME" />
"""
        |> String.replace "KNOB_NAME" knobName
        |> String.replace "CODE" code


knobDocToTemplate : KnobDoc a x -> String
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


knobDocToComponent : KnobDoc a x -> ( String, SharedModel x -> Html (Msg (SharedModel x)) )
knobDocToComponent knobDoc =
    let
        knobView : SharedModel x -> Html (Msg (SharedModel x))
        knobView sharedModel =
            Html.div [ class "component-preview" ]
                [ knobDoc.view sharedModel
                , Html.div []
                    [ Html.text ("Value: " ++ knobDoc.valueAsString sharedModel) ]
                ]
    in
    ( knobDoc.name, knobView )
