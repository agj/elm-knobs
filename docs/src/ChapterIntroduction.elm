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
            [ ( nameFloat, componentFloat )
            , ( nameFloatConstrained, componentFloatConstrained )
            , ( nameInt, componentInt )
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
        |> String.replace "$FLOAT$" templateFloat
        |> String.replace "$FLOAT_CONSTRAINED$" templateFloatConstrained
        |> String.replace "$INT$" templateInt


type alias Model =
    { float : Knob Float
    , floatConstrained : Knob Float
    , int : Knob Int
    }


type alias SharedModel a =
    { a | introduction : Model }


init =
    { float = initFloat
    , floatConstrained = initFloatConstrained
    , int = initInt
    }


update : Model -> SharedModel a -> SharedModel a
update newModel sharedModel =
    { sharedModel | introduction = newModel }



-- float


nameFloat : String
nameFloat =
    "float"


initFloat : Knob Float
initFloat =
    Knob.float { step = 0.01, initial = 0 }


templateFloat : String
templateFloat =
    "Knob.float { step = 0.01, initial = 0 }"
        |> knobCodeToTemplate nameFloat


updateFloat : Model -> Knob Float -> Model
updateFloat model newFloat =
    { model | float = newFloat }


componentFloat : SharedModel a -> Html (Msg (SharedModel a))
componentFloat sharedModel =
    knobPreview
        (sharedModel.introduction.float
            |> Knob.view (ElmBook.Actions.updateStateWith (updateFloat sharedModel.introduction >> update))
        )
        (Knob.value sharedModel.introduction.float |> String.fromFloat)



-- floatConstrained


nameFloatConstrained : String
nameFloatConstrained =
    "floatConstrained"


initFloatConstrained : Knob Float
initFloatConstrained =
    Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }


templateFloatConstrained : String
templateFloatConstrained =
    "Knob.floatConstrained { step = 0.01, range = ( 0, 1 ), initial = 0 }"
        |> knobCodeToTemplate nameFloatConstrained


updateFloatConstrained : Model -> Knob Float -> Model
updateFloatConstrained model newFloatConstrained =
    { model | floatConstrained = newFloatConstrained }


componentFloatConstrained : SharedModel a -> Html (Msg (SharedModel a))
componentFloatConstrained sharedModel =
    knobPreview
        (sharedModel.introduction.floatConstrained
            |> Knob.view (ElmBook.Actions.updateStateWith (updateFloatConstrained sharedModel.introduction >> update))
        )
        (Knob.value sharedModel.introduction.floatConstrained |> String.fromFloat)



-- int


nameInt : String
nameInt =
    "int"


initInt : Knob Int
initInt =
    Knob.int { step = 1, initial = 0 }


templateInt : String
templateInt =
    "Knob.int { step = 1, initial = 0 }"
        |> knobCodeToTemplate nameInt


updateInt : Model -> Knob Int -> Model
updateInt model newInt =
    { model | int = newInt }


componentInt : SharedModel a -> Html (Msg (SharedModel a))
componentInt sharedModel =
    knobPreview
        (sharedModel.introduction.int
            |> Knob.view (ElmBook.Actions.updateStateWith (updateInt sharedModel.introduction >> update))
        )
        (Knob.value sharedModel.introduction.int |> String.fromInt)



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
