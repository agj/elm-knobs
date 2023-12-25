module KnobDoc exposing (..)

import Browser.Dom
import Constants
import ElmBook exposing (Msg)
import ElmBook.Actions exposing (updateState, updateStateWithCmd)
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Json.Decode
import Knob exposing (Knob)
import String.Extra
import Task


type alias KnobDoc a model =
    { name : String
    , init_ : Knob a
    , code : String
    , get : model -> Knob a
    , set : model -> Knob a -> model
    , toString : a -> String
    }


toComponentWithId :
    (sharedModel -> model)
    -> (model -> sharedModel -> sharedModel)
    -> KnobDoc a model
    -> List ( String, sharedModel -> Html (Msg sharedModel) )
toComponentWithId getModel setModel knobDoc =
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
    [ ( knobDoc.name, knobView )
    , ( "id-" ++ knobDoc.name, \_ -> Html.span [ Html.Attributes.id knobDoc.name ] [] )
    , ( "toc-link-" ++ knobDoc.name, tocLinkComponent { label = knobDoc.name, targetId = knobDoc.name } )
    ]


tocLinkComponent : { label : String, targetId : String } -> model -> Html (Msg model)
tocLinkComponent { label, targetId } _ =
    let
        scroll : model -> ( model, Cmd (Msg model) )
        scroll model =
            ( model
            , Browser.Dom.setViewportOf "elm-book-main" 0 500
                |> Task.attempt (\_ -> updateState identity)
            )
    in
    Html.span
        [ Html.Events.onClick (updateStateWithCmd scroll)
        , Html.Attributes.style "text-decoration" "underline"
        , Html.Attributes.style "cursor" "pointer"
        , Html.Attributes.attribute "role" "link"
        , Html.Attributes.tabindex 0
        ]
        [ Html.text label ]


toTemplate : KnobDoc a model -> String
toTemplate knobDoc =
    """
## <component with-label="id-$knobName$" with-display="inline" />$knobName$

📦 [See it in the package docs.](https://package.elm-lang.org/packages/agj/elm-knobs/$elmKnobsVersion$/Knob#$knobName$)

<component with-label="$knobName$" />

```elm
$code$
```
"""
        |> String.replace "$knobName$" knobDoc.name
        |> String.replace "$code$" (knobDoc.code |> String.Extra.unindent |> String.trim)
        |> String.replace "$elmKnobsVersion$" Constants.elmKnobsVersion
