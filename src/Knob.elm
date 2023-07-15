module Knob exposing
    ( Knob
    , float, floatConstrained, floatSlider
    , int, intConstrained, intSlider
    , boolCheckbox
    , select
    , custom
    , view, styles
    , value
    , compose, stack
    , label, stackLabel
    )

{-| Let's get started creating a control panel full of “knobs” to interactively tweak values in our application.

When creating a knob, two considerations are important.
The first is the type of the value you need to control.
So far we don't have many options, as only knobs that control numbers (`Int`s and `Float`s) are available in this package.
The second important consideration is the interface you want to provide to manipulate that value,
i.e. the control itself.
This package's knobs are named putting the value's type first,
so it's easier to find the one you want according to the value you need to produce.

@docs Knob


# Creating knobs for base values

First up, within our app's `init` let's create a `Knob` and put it in the model.
The following are the functions you can use to create basic knobs that map to a single primitive value.

@docs float, floatConstrained, floatSlider
@docs int, intConstrained, intSlider
@docs boolCheckbox
@docs select, color


## Custom knobs

@docs custom


# Displaying

The next step is to actually show our knob in the page.

@docs view, styles


# Retrieving the value

Of course, our knobs are of no use to us if we can't read the value entered by the user.

@docs value


# Composing knobs

Most of the time you'll want to control multiple values.
For that purpose we're going to “stack” our knobs together.

@docs compose, stack


# Organization

We could have a bunch of similar knobs in our panel and not know what each of them does,
so let's make sure we do!

@docs label, stackLabel

-}

import Color exposing (Color)
import Hex
import Html exposing (Html)
import Html.Attributes
import Html.Events


{-| Represents one user-interactive control mapped to one value of type `a`,
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


{-| Creates an input field knob for manually entering any floating point number.
The `step` argument specifies the amount the number will increase or decrease
when pressing the up and down keys.
`initial` is just the value it takes on first load.
-}
float :
    { step : Float
    , initial : Float
    }
    -> Knob Float
float { step, initial } =
    floatInternal step (String.fromFloat initial)


{-| Creates an input field knob for manually entering numbers within a specific range,
where `range = ( min, max )`.
The `step` argument specifies the amount the number will increase or decrease
when pressing the up and down keys.
`initial` is just the value it takes on first load.
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
Requires a `range = ( min, max )` to set the boundaries of the slider control.
`initial` is just the value it takes on first load.

The `step` argument indicates the granularity of the values the slider will allow,
so a step of `1` will produce a slider that jumps between values like `1`, `2`, `3` as you slide it to the right,
whereas a step of `0.1` will produce one that allows setting values like `1.1` or `2.5`.

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

        input : () -> Html (Knob Float)
        input () =
            Html.div []
                [ Html.input
                    [ Html.Attributes.type_ "range"
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
                    , Html.Attributes.value (String.fromFloat initial)
                    ]
                    []
                , Html.div [] [ Html.text (String.fromFloat initial) ]
                ]
    in
    Knob
        { value = initial
        , view = SingleView input
        }


{-| Creates an input field knob for manually entering any integer.
The `step` argument specifies the amount the number will increase or decrease
when pressing the up and down keys.
`initial` is just the value it takes on first load.
-}
int :
    { step : Int
    , initial : Int
    }
    -> Knob Int
int { step, initial } =
    intInternal step (String.fromInt initial)


{-| Creates an input field knob for manually entering integers within a specific range.
The `step` argument specifies the amount the number will increase or decrease
when pressing the up and down keys.
`initial` is just the value it takes on first load.
-}
intConstrained :
    { range : ( Int, Int )
    , step : Int
    , initial : Int
    }
    -> Knob Int
intConstrained { range, step, initial } =
    let
        ( rangeLow, rangeHigh ) =
            range
    in
    intConstrainedInternal ( rangeLow, rangeHigh ) step (String.fromInt initial)


{-| Creates a slider knob useful for quickly tweaking integers when precision is not needed.
Requires a `range = ( min, max )` to set the boundaries of the slider control.
`initial` is just the value it takes on first load.

The `step` argument indicates the granularity of the values the slider will allow,
so a step of `1` will produce a slider that will set on any integer value as you slide it to the right,
whereas a step of `10` will produce one that makes bigger jumps between `10`, `20`, `30`, etc.

-}
intSlider :
    { range : ( Int, Int )
    , step : Int
    , initial : Int
    }
    -> Knob Int
intSlider { range, step, initial } =
    let
        ( rangeLow, rangeHigh ) =
            range

        input : () -> Html (Knob Int)
        input () =
            Html.div []
                [ Html.input
                    [ Html.Attributes.type_ "range"
                    , Html.Attributes.min (String.fromInt rangeLow)
                    , Html.Attributes.max (String.fromInt rangeHigh)
                    , Html.Attributes.step (String.fromInt step)
                    , Html.Events.onInput
                        (\val ->
                            intSlider
                                { range = ( rangeLow, rangeHigh )
                                , step = step
                                , initial = String.toInt val |> Maybe.withDefault rangeLow
                                }
                        )
                    , Html.Attributes.value (String.fromInt initial)
                    ]
                    []
                , Html.div [] [ Html.text (String.fromInt initial) ]
                ]
    in
    Knob
        { value = initial
        , view = SingleView input
        }


{-| Creates a checkbox representing a boolean value.
`initial` determines whether it will be initially checked or not.
-}
boolCheckbox : Bool -> Knob Bool
boolCheckbox initial =
    let
        checkbox : () -> Html (Knob Bool)
        checkbox () =
            Html.input
                [ Html.Attributes.type_ "checkbox"
                , Html.Attributes.checked initial
                , Html.Events.onCheck (\val -> boolCheckbox val)
                ]
                []
    in
    Knob
        { value = initial
        , view = SingleView checkbox
        }


{-| Creates a dropdown select input for a custom type or any arbitrary value you wish.
You'll need to provide a list of `String`s that represent each selectable option.
You'll also need a `fromString` function that maps these strings to your type,
and the reverse `toString` which converts a value of your type to one of the option strings.

Here's a simple example mapping "yes" and "no" options to `Bool` values:

    Knob.select
        { options = [ "yes", "no" ]
        , toString =
            \bool ->
                case bool of
                    True ->
                        "yes"

                    False ->
                        "no"
        , fromString = \string -> string == "yes"
        , initial = False
        }

-}
select :
    { options : List String
    , toString : a -> String
    , fromString : String -> a
    , initial : a
    }
    -> Knob a
select config =
    let
        optionElement : String -> Html (Knob a)
        optionElement text =
            let
                parsed : a
                parsed =
                    config.fromString text
            in
            Html.option
                [ Html.Attributes.value text
                , Html.Attributes.selected (config.initial == parsed)
                ]
                [ Html.text text ]

        optionElements : List (Html (Knob a))
        optionElements =
            config.options
                |> List.map optionElement

        selectElement : () -> Html (Knob a)
        selectElement () =
            Html.select
                [ Html.Events.onInput
                    (\selectionString ->
                        select { config | initial = config.fromString selectionString }
                    )
                ]
                optionElements
    in
    Knob
        { value = config.initial
        , view = SingleView selectElement
        }


{-| Color
-}
color : Color -> Knob Color
color initial =
    let
        fromString : String -> Color
        fromString str =
            Result.withDefault initial <|
                case String.uncons str of
                    Just ( '#', rest ) ->
                        Hex.fromString rest
                            |> Result.map
                                (\num ->
                                    let
                                        red =
                                            num // (16 * 16)

                                        green =
                                            (num // 16) - red

                                        blue =
                                            num - green
                                    in
                                    Color.rgb255 red green blue
                                )

                    _ ->
                        Result.Err ""

        toString : Color -> String
        toString color_ =
            let
                { red, green, blue } =
                    Color.toRgba color_

                toHex : Float -> String
                toHex num =
                    floor (num * 255)
                        |> Hex.toString
            in
            "#" ++ toHex red ++ toHex green ++ toHex blue

        picker : () -> Html (Knob Color)
        picker () =
            Html.input
                [ Html.Attributes.type_ "color"
                , Html.Attributes.value (toString initial)
                , Html.Events.onInput (\colorString -> color (fromString colorString))
                ]
                []
    in
    Knob
        { value = initial
        , view = SingleView picker
        }


{-| Creates a knob for any type, using a custom HTML view that you supply.
You can use this function if there is some kind of knob you need
that is not available in this package.

Knobs are comprised of a `value` of the appropriate type,
and a `view` which listens to user input
(typically the `Html.Events.onInput` event)
and emits the updated knob, instead of a regular message like is normally done.
In this sense, knobs are recursive, as their view needs to construct a new knob,
typically by calling the very same constructor function that created it in the first place.

Here's how the `boolCheckbox` knob would be created using `custom`:

    ourBoolKnob : Bool -> Knob Bool
    ourBoolKnob initial =
        let
            view : () -> Html (Knob Bool)
            view () =
                Html.input
                    [ Html.Attributes.type_ "checkbox"
                    , Html.Attributes.checked initial
                    , Html.Events.onChecked ourBoolKnob
                    ]
                    []
        in
        Knob.custom
            { value = initial
            , view = view
            }

Notice how `view` is a thunk—that is, a function that takes `()` (a placeholder value)
and returns the view.
The view is just some HTML that emits knobs instead of messages.
Take a look at the line with `Html.Events.onChecked` and make note of what we're doing:
We're directly passing in `ourBoolKnob` because it's a function that takes
the new "checked" value and with it constructs the knob anew.
This is how we're transforming the contained value when the user clicks.

A thing to keep in mind: For cases in which you're taking unconstrained user input,
such as a text field, you can wind up making it so that the user cannot input freely.
This occurs if you're parsing the input into a different type in a lossy manner.

Let's imagine we want to display a text field to map a `String` to a `Vegetable` type.
In the naïve case, our knob's signature could look like this, taking `Vegetable`
to set the initial value:

    vegetableKnob : Vegetable -> Knob Vegetable

It would convert the initial value to a `String`, and set that as the text field's text.
Then, upon user input, we'd parse the input `String` into our type,
and use that to construct the updated knob.

The problem with this situation is that if the conversion from `String` to `Vegetable`
and then back into `String` is lossy (i.e., the result is not the same as what the user typed,)
then the user won't be able to type some things, as they'll be changing every time
they hit a key.

    vegetableFromString : String -> Vegetable
    vegetableFromString text =
        case text of
            "carrot" ->
                Carrot

            _ ->
                Tomato

If we're using the function above to parse user input into `Vegetable`,
the user may want to type "carrot" and start typing "c",
but as it's not yet a valid value, it will be parsed as `Tomato`
and the text field's text will be reset to whatever the string value for `Tomato` is.

In order to prevent this behavior, set the unparsed input text as the text field's `value` property,
and set the parsed result as the knob's `value`.
This means that your knob will need to take a `String` as its initial value.

    vegetableKnob : String -> Knob Vegetable
    vegetableKnob initial =
        Knob.custom
            { value = vegetableFromString initial -- Parse here!
            , view =
                \() ->
                    Html.input
                        [ Html.Attributes.type_ "text"
                        , Html.Attributes.value initial -- No parsing
                        , Html.Events.onInput vegetableKnob
                        ]
                        []
            }

-}
custom :
    { value : a
    , view : () -> Html (Knob a)
    }
    -> Knob a
custom config =
    Knob
        { value = config.value
        , view = SingleView config.view
        }



-- VIEW


{-| Converts a knob into HTML to put in your view.
You should display a single [`Knob`](Knob#Knob) value at any which time,
so if you need multiple knobs, make sure you [`compose`](Knob#compose) them into a single value!

Knobs keep track of their state once they're put in the view,
but for that you need to wire them up with a message,
which is the first argument that this function takes.

This function produces plain HTML with no styles, so make sure you also include [`styles`](Knob#styles)
in your page to make it display properly, or provide your own custom styles.

    -- Prepare a message for your knob:
    type Msg =
        KnobUpdated (Knob YourType)

    -- Put this as an HTML node within your view:
    Knob.view KnobUpdated yourKnob

Check [the documentation's readme](https://package.elm-lang.org/packages/agj/elm-knobs/latest/) for a full demonstration on how to wire things up.

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

You could choose not to use these default styles and instead provide your own.
I recommend you check the DOM output in your browser's inspector—the structure of the HTML produced is pretty simple!

-}
styles : Html msg
styles =
    Html.node "style"
        []
        [ Html.text css ]



-- ACCESSING


{-| Extract the current value out of a knob.
Use it in your view to affect what you display.

    Knob.value someKnob

-}
value : Knob a -> a
value (Knob config) =
    config.value



-- COMPOSITION


{-| Creates a knob that joins multiple knobs to build up a record
(or actually any data structure you want, depending on the `constructor` argument you pass it!).

Pipe ([`|>`](/packages/elm/core/latest/Basics#%7C%3E)) the knobs into it
using [`stack`](Knob#stack) or [`stackLabel`](Knob#stackLabel) in order to provide the arguments.

    type alias Controls =
        { someNumber : Float
        , anInteger : Int
        }

    aKnob =
        Knob.compose Controls
            -- This knob will map to `someNumber`:
            |> Knob.stack (Knob.float 1 0)
            -- This one will map to `anInteger`:
            |> Knob.stack (Knob.int 1 0)

Here's how you use it to build up a different data structure, in this case a tuple.
Notice that the number of arguments in the function matches the number of “stacks”.

    anotherKnob =
        Knob.compose (\theFloat theInt -> ( theFloat, theInt ))
            |> Knob.stack (Knob.float 1 0)
            |> Knob.stack (Knob.int 1 0)

-}
compose : (a -> b) -> Knob (a -> b)
compose constructor =
    Knob
        { value = constructor
        , view = StackView []
        }


{-| Adds a knob into a [`compose`](Knob#compose) knob.
See the documentation for that for an example.

This function is called “stack” because the order you compose your knobs does matter,
as they will be displayed one on top of the other!

-}
stack : Knob a -> Knob (a -> b) -> Knob b
stack (Knob config) (Knob pipe) =
    let
        viewToList : KnobView c -> List (() -> Html (Knob c))
        viewToList view_ =
            case view_ of
                SingleView v ->
                    [ v ]

                StackView vs ->
                    vs

        stackView : (c -> d) -> (() -> Html c) -> () -> Html d
        stackView replacement view_ () =
            Html.map replacement (view_ ())

        stackedView : KnobView b
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



-- ORGANIZATION


{-| Attaches a text description next to a knob, as a way to identify what the control is for.

The following example will produce a [`float`](Knob#float) knob described as “x position”.

    Knob.label "x position" (Knob.float 1 0)

-}
label : String -> Knob a -> Knob a
label text (Knob config) =
    let
        labeled : () -> Html (Knob a)
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


{-| Convenience function that unifies the functionality of [`stack`](Knob#stack) and [`label`](Knob#label).

The two examples below produce the same identical result:

    -- The simplified way:
    Knob.stackLabel "Some label" someKnob

    -- The regular way:
    Knob.stack (Knob.label "Some label" someKnob)

-}
stackLabel : String -> Knob a -> Knob (a -> b) -> Knob b
stackLabel text knob =
    stack (label text knob)



-- INTERNAL


floatInternal : Float -> String -> Knob Float
floatInternal step initial =
    let
        input : () -> Html (Knob Float)
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
        floatValue : Float
        floatValue =
            String.toFloat initial
                |> Maybe.withDefault 0
                |> max rangeLow
                |> min rangeHigh

        input : () -> Html (Knob Float)
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


intInternal : Int -> String -> Knob Int
intInternal step initial =
    let
        input : () -> Html (Knob Int)
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


intConstrainedInternal : ( Int, Int ) -> Int -> String -> Knob Int
intConstrainedInternal ( rangeLow, rangeHigh ) step initial =
    let
        intValue : Int
        intValue =
            String.toInt initial
                |> Maybe.withDefault 0
                |> max rangeLow
                |> min rangeHigh

        input : () -> Html (Knob Int)
        input () =
            Html.input
                [ Html.Attributes.type_ "number"
                , Html.Attributes.value initial
                , Html.Attributes.step (String.fromInt step)
                , Html.Events.onInput (intConstrainedInternal ( rangeLow, rangeHigh ) step)
                , Html.Events.onBlur (intConstrainedInternal ( rangeLow, rangeHigh ) step (String.fromInt intValue))
                ]
                []
    in
    Knob
        { value = intValue
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


css : String
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
        border-radius: 50%;
        display: flex;
        height: var(--size);
        justify-content: center;
        line-height: 1;
        margin: calc(1 * var(--separation));
        width: var(--size);
    }

    .knobs .knobs-icon > * {
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

    .knobs label:has(> input[type="checkbox"]) {
        flex-direction: row;
        align-items: center;
    }

    /* The following use of :has() is so that browsers that don't support that selector
       may ignore this block.
    */
    .knobs label:has(> input) > input[type="checkbox"] {
        order: -1;
    }

    .knobs input[type="range"] + * {
        color: darkgray;
        text-align: center;
    }
    """
