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
    , link : Maybe (List String)
    , init_ : Knob a
    , code : String
    , get : model -> Knob a
    , set : model -> Knob a -> model
    , toString : a -> String
    }


type alias ProcessedKnobDoc sharedModel =
    { name : String
    , link : Maybe (List String)
    , code : String
    , component : ( String, sharedModel -> Html (Msg sharedModel) )
    }


type alias Templatable x =
    { x
        | name : String
        , link : Maybe (List String)
        , code : String
    }


type alias Componentable x a model =
    { x
        | name : String
        , get : model -> Knob a
        , set : model -> Knob a -> model
        , toString : a -> String
    }


process :
    (sharedModel -> model)
    -> (model -> sharedModel -> sharedModel)
    -> KnobDoc a model
    -> ProcessedKnobDoc sharedModel
process getModel setModel knobDoc =
    { name = knobDoc.name
    , link = knobDoc.link
    , code = knobDoc.code
    , component = toComponent getModel setModel knobDoc
    }


toFullTemplate : List (ProcessedKnobDoc sharedModel) -> String
toFullTemplate processedKnobDocs =
    processedKnobDocs
        |> List.map toTemplate
        |> String.join "\n\n\n"


toComponent :
    (sharedModel -> model)
    -> (model -> sharedModel -> sharedModel)
    -> Componentable x a model
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


toTemplate : Templatable x -> String
toTemplate knobDoc =
    """
## $knobName$

$apiDocsLink$

<component
    with-label="$knobName$"
    with-hidden-label="true"
/>

```elm
$code$
```
"""
        |> String.replace "$knobName$" knobDoc.name
        |> String.replace "$apiDocsLink$" (apiDocsLink knobDoc)
        |> String.replace "$code$" (knobDoc.code |> String.Extra.unindent |> String.trim)
        |> String.replace "$elmKnobsVersion$" Constants.elmKnobsVersion


apiDocsLink : { a | name : String, link : Maybe (List String) } -> String
apiDocsLink { name, link } =
    case link of
        Nothing ->
            "📦 [API docs.](https://package.elm-lang.org/packages/agj/elm-knobs/$elmKnobsVersion$/Knob#$name$)"
                |> String.replace "$name$" name
                |> String.replace "$elmKnobsVersion$" Constants.elmKnobsVersion

        Just links ->
            links
                |> List.map
                    (\linkName ->
                        "- 📦 [API docs for: `$name$`](https://package.elm-lang.org/packages/agj/elm-knobs/$elmKnobsVersion$/Knob#$name$)"
                            |> String.replace "$name$" linkName
                            |> String.replace "$elmKnobsVersion$" Constants.elmKnobsVersion
                    )
                |> String.join "\n"
