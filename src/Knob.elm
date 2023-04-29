module Knob exposing
    ( Knob
    , float, floatConstrained, floatSlider
    , int
    , record, stack
    , label, stackLabel
    , view, styles, value
    )

{-| Let's get started creating a control panel full of “knobs” to interactively tweak values in our application.

When creating a knob, two considerations are important.
The first is the type of the value you need to control.
So far we don't have much, only numbers are available (`Int`s and `Float`s).
The second important consideration is the interface you want to provide to manipulate that value,
i.e. the control itself.
This package's knobs are named putting the type first,
so it's easier to find the one you want according to the value you need to produce.

@docs Knob


# Creating knobs for base values

@docs float, floatConstrained, floatSlider
@docs int


# Composing knobs

Most of the time you'll want to control multiple values, and therefore need multiple controls.
That's what stacking is for.

@docs record, stack


# Organization

@docs label, stackLabel


# Displaying

@docs view, styles, value

-}

import Html exposing (Html)
import Html.Attributes
import Html.Events


{-| Represents one user-interactive control mapped to one value,
which this package refers to as a “knob”.
This is the base type used to create your knobs control panel!
Normally you'll have one of these stored in your model.
-}
type Knob a
    = Knob (Config a)


type alias Config a =
    { value : a
    , view : KnobView a
    }


type KnobView a
    = SingleView (() -> Html (Knob a))
    | StackView (List (() -> Html (Knob a)))



-- CREATION


{-| Creates a field for manually inputting any floating point number.
The `step` argument specifies the amount the number will increase or decrease
when pressing the up and down keys.
-}
float :
    { step : Float
    , initial : Float
    }
    -> Knob Float
float { step, initial } =
    floatInternal step (String.fromFloat initial)


{-| Creates a field for manually inputting numbers within a specific range.
The `step` argument specifies the amount the number will increase or decrease
when pressing the up and down keys.
-}
floatConstrained :
    { range : ( Float, Float )
    , step : Float
    , initial : Float
    }
    -> Knob Float
floatConstrained { range, step, initial } =
    let
        ( rangeLow, rangeHigh ) =
            range
    in
    floatConstrainedInternal ( rangeLow, rangeHigh ) step (String.fromFloat initial)


{-| Creates a slider knob useful for quickly tweaking numbers when precision is not needed.
Requires a range to constrain the number it generates.
The `step` argument specifies the amount the number will increase or decrease
when pressing the up and down keys.
-}
floatSlider :
    { range : ( Float, Float )
    , step : Float
    , initial : Float
    }
    -> Knob Float
floatSlider { range, step, initial } =
    let
        ( rangeLow, rangeHigh ) =
            range

        input () =
            Html.div []
                [ Html.input
                    [ Html.Attributes.type_ "range"
                    , Html.Attributes.value (String.fromFloat initial)
                    , Html.Attributes.min (String.fromFloat rangeLow)
                    , Html.Attributes.max (String.fromFloat rangeHigh)
                    , Html.Attributes.step (String.fromFloat step)
                    , Html.Events.onInput
                        (\val ->
                            floatSlider
                                { range = ( rangeLow, rangeHigh )
                                , step = step
                                , initial = String.toFloat val |> Maybe.withDefault rangeLow
                                }
                        )
                    ]
                    []
                , Html.div [] [ Html.text (String.fromFloat initial) ]
                ]
    in
    Knob
        { value = initial
        , view = SingleView input
        }


{-| Creates a field for manually inputting any integer.
The `step` argument specifies the amount the number will increase or decrease
when pressing the up and down keys.
-}
int :
    { step : Int
    , initial : Int
    }
    -> Knob Int
int { step, initial } =
    intInternal step (String.fromInt initial)


{-| Attaches a text description to a knob.
-}
label : String -> Knob a -> Knob a
label text (Knob config) =
    let
        labeled () =
            Html.label []
                [ Html.text text
                , viewInternal (label text) config
                ]
    in
    Knob
        { value = config.value
        , view = SingleView labeled
        }


{-| Creates a knob that maps a stack of multiple knobs to build up a record.
Pipe (`|>`) the knobs into it using `stack` or `stackField`.

    type alias MyKnob =
        { someNumber : Float }

    myKnob =
        Knob.record MyKnob
            |> Knob.stack (Knob.float 1 0)

-}
record : (a -> b) -> Knob (a -> b)
record constructor =
    Knob
        { value = constructor
        , view = StackView []
        }


{-| Adds a knob into a `record` knob.
-}
stack : Knob a -> Knob (a -> b) -> Knob b
stack (Knob config) (Knob pipe) =
    let
        viewToList view_ =
            case view_ of
                SingleView v ->
                    [ v ]

                StackView vs ->
                    vs

        stackView replacement v () =
            Html.map replacement (v ())

        stackedView =
            (viewToList pipe.view
                |> List.map (stackView (\newPipe -> stack (Knob config) newPipe))
            )
                ++ (viewToList config.view
                        |> List.map (stackView (\new -> stack new (Knob pipe)))
                   )
                |> StackView
    in
    Knob
        { value = pipe.value config.value
        , view = stackedView
        }


{-| Convenience function that unifies the functionality of `stack` and `label`.
Same as doing `stack (label "My label" myKnob)`.
-}
stackLabel : String -> Knob a -> Knob (a -> b) -> Knob b
stackLabel text knob =
    stack (label text knob)



-- ACCESSING


{-| Extract the current value out of a knob.
-}
value : Knob a -> a
value (Knob config) =
    config.value



-- VIEW


{-| Converts a knob into HTML to put in your view.
-}
view : (Knob a -> msg) -> Knob a -> Html msg
view toMsg (Knob config) =
    Html.aside [ Html.Attributes.class "knobs" ]
        [ Html.div [ Html.Attributes.class "knobs-icon" ]
            [ Html.div []
                [ Html.text "🎛" ]
            ]
        , Html.div []
            [ viewInternal toMsg config ]
        ]


{-| Default styles for the knobs, provided as a `<style>` tag.
Put this as a child somewhere in your view in order to use them.
-}
styles : Html msg
styles =
    Html.node "style"
        []
        [ Html.text css ]



-- INTERNAL


floatInternal : Float -> String -> Knob Float
floatInternal step initial =
    let
        input () =
            Html.input
                [ Html.Attributes.type_ "number"
                , Html.Attributes.value initial
                , Html.Attributes.step (String.fromFloat step)
                , Html.Events.onInput (floatInternal step)
                ]
                []
    in
    Knob
        { value = String.toFloat initial |> Maybe.withDefault 0
        , view = SingleView input
        }


floatConstrainedInternal : ( Float, Float ) -> Float -> String -> Knob Float
floatConstrainedInternal ( rangeLow, rangeHigh ) step initial =
    let
        floatValue =
            String.toFloat initial
                |> Maybe.withDefault 0
                |> max rangeLow
                |> min rangeHigh

        input () =
            Html.input
                [ Html.Attributes.type_ "number"
                , Html.Attributes.value initial
                , Html.Attributes.step (String.fromFloat step)
                , Html.Events.onInput (floatConstrainedInternal ( rangeLow, rangeHigh ) step)
                , Html.Events.onBlur (floatConstrainedInternal ( rangeLow, rangeHigh ) step (String.fromFloat floatValue))
                ]
                []
    in
    Knob
        { value = floatValue
        , view = SingleView input
        }


viewInternal : (Knob a -> b) -> Config a -> Html b
viewInternal mapper config =
    case config.view of
        SingleView v ->
            Html.map mapper (v ())

        StackView vs ->
            vs
                |> List.map (\v -> Html.map mapper (v ()))
                |> Html.div [ Html.Attributes.class "knobs-stack" ]


intInternal : Int -> String -> Knob Int
intInternal step initial =
    let
        input () =
            Html.input
                [ Html.Attributes.type_ "number"
                , Html.Attributes.value initial
                , Html.Attributes.step (String.fromInt step)
                , Html.Events.onInput (intInternal step)
                ]
                []
    in
    Knob
        { value = String.toInt initial |> Maybe.withDefault 0
        , view = SingleView input
        }


css =
    """
    .knobs {
        --separation: 0.5em;

        bottom: 0;
        color: black;
        display: flex;
        font-size: 14px;
        gap: var(--separation);
        left: 0;
        max-height: 100vh;
        position: fixed;
        z-index: 888;
    }
    
    .knobs > * {
        background-color: white;
        box-shadow: 0 0 0.4em rgba(0, 0, 0, 0.2);
    }

    .knobs > :not(.knobs-icon) {
        display: none;
        padding: calc(3 * var(--separation));
        overflow-y: auto;
    }

    .knobs:hover > :not(.knobs-icon) {
        display: block;
    }

    .knobs .knobs-icon {
        --size: 3.5em;

        align-items: center;
        display: flex;
        height: var(--size);
        justify-content: center;
        line-height: 1;
        width: var(--size);
        border-radius: 50%;
        margin: calc(1 * var(--separation));
    }

    .knobs .knobs-icon > * {
        margin-top: 0.2em;
        font-size: 2em;
    }

    .knobs:hover > .knobs-icon {
        display: none;
    }

    .knobs .knobs-stack {
        display: flex;
        flex-direction: column;
        gap: calc(2 * var(--separation));
    }

    .knobs label {
        display: flex;
        flex-direction: column;
        gap: var(--separation);
    }

    input[type="range"] + * {
        color: darkgray;
        text-align: center;
    }
    """
