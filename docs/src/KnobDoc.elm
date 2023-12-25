module KnobDoc exposing (..)

import Constants
import ElmBook exposing (Msg)
import ElmBook.Actions
import Html exposing (Html)
import Html.Attributes
import Knob exposing (Knob)
import String.Extra


type alias KnobDoc a model =
    { name : String
    , init_ : Knob a
    , code : String
    , get : model -> Knob a
    , set : model -> Knob a -> model
    , toString : a -> String
    }


type alias ProcessedKnobDoc sharedModel =
    { name : String
    , code : String
    , component : ( String, sharedModel -> Html (Msg sharedModel) )
    , template : String
    }


type alias Templatable a =
    { a | name : String, code : String }


process :
    (sharedModel -> model)
    -> (model -> sharedModel -> sharedModel)
    -> KnobDoc a model
    -> ProcessedKnobDoc sharedModel
process getModel setModel knobDoc =
    { name = knobDoc.name
    , code = knobDoc.code
    , component = toComponent getModel setModel knobDoc
    , template = toTemplate knobDoc
    }


toFullTemplate : List (ProcessedKnobDoc sharedModel) -> String
toFullTemplate processedKnobDocs =
    processedKnobDocs
        |> List.map toTemplate
        |> String.join "\n\n\n"


toComponent :
    (sharedModel -> model)
    -> (model -> sharedModel -> sharedModel)
    -> KnobDoc a model
    -> ( String, sharedModel -> Html (Msg sharedModel) )
toComponent getModel setModel knobDoc =
    let
        knobView : sharedModel -> Html (Msg sharedModel)
        knobView sharedModel =
            let
                model =
                    getModel sharedModel
            in
            Html.div [ Html.Attributes.class "component-preview" ]
                [ knobDoc.get model
                    |> Knob.view (ElmBook.Actions.updateStateWith (knobDoc.set model >> setModel))
                , Html.div []
                    [ Html.text ("Value: " ++ (model |> knobDoc.get |> Knob.value |> knobDoc.toString)) ]
                ]
    in
    ( knobDoc.name, knobView )


toTemplate : Templatable a -> String
toTemplate knobDoc =
    """
## $knobName$

📦 [See it in the package docs.](https://package.elm-lang.org/packages/agj/elm-knobs/$elmKnobsVersion$/Knob#$knobName$)

<component with-label="$knobName$" />

```elm
$code$
```
"""
        |> String.replace "$knobName$" knobDoc.name
        |> String.replace "$code$" (knobDoc.code |> String.Extra.unindent |> String.trim)
        |> String.replace "$elmKnobsVersion$" Constants.elmKnobsVersion
