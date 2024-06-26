module Knob exposing
    ( Knob
    , float, floatConstrained, floatSlider
    , int, intConstrained, intSlider
    , stringInput, stringTextarea
    , boolCheckbox
    , select, Color, colorPicker
    , view, viewWithOptions, styles
    , value
    , compose, stack
    , label, stackLabel
    , map
    , serialize, readSerialized
    , custom
    )

{-| Let's get started creating a control panel full of “knobs” to interactively
tweak values in our application.

When creating a knob, two considerations are important. The first is the type
of the value you need to control. This package currently provides knobs for
numbers, strings, booleans, enumerated choices (custom types or anything like
that) and colors out of the box, and there is a way to either transform one into
another type ([`map`](#map)), or to create an entirely new knob
([`custom`](#custom)).

The second important consideration is the interface you want to provide to
manipulate that value, i.e. the control itself. Many knobs offer different
controls for the same type, particularly number-related ones, so pick the one
that best suits your needs!

@docs Knob


# Creating knobs for base values

First up, within our app's `init` let's create a `Knob` and put it in the model.
The following are the functions you can use to create basic knobs that map to a
single value.

👀 Tip: Check the [**interactive documentation**][interactive-docs] to see
working examples of these!

[interactive-docs]: https://agj.github.io/elm-knobs/1.2.0/

@docs float, floatConstrained, floatSlider
@docs int, intConstrained, intSlider
@docs stringInput, stringTextarea
@docs boolCheckbox
@docs select, Color, colorPicker


# Displaying

The next step is to actually display our knob in the page.

@docs view, viewWithOptions, styles


# Retrieving the value

Of course, our knobs are of no use to us if we can't read the value entered by
the user.

@docs value


# Composing knobs

Most of the time you'll want to control multiple values. For that purpose we're
going to “stack” our knobs together.

@docs compose, stack


# Organization

We could have a bunch of similar knobs in our panel and not know what each of
them does, so let's make sure we do!

@docs label, stackLabel


# Transformation

@docs map


# Serialization

The value of your knobs will be reset every time you refresh the page, unless
you persist their value somehow. Knob serialization is a way to make it easier
to do this using the Web Storage API or other such techniques. Check [this
example](https://github.com/agj/elm-knobs/blob/1.2.0/examples/web-storage/) to
see how to do it.

@docs serialize, readSerialized


# Custom knobs

@docs custom

-}

import Hex
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Internal.Constants
import Internal.Option exposing (Anchor(..), Option(..))
import Json.Decode
import Json.Encode
import Knob.Option exposing (Option)


{-| Represents one user-interactive control mapped to one value of type `a`,
which this package refers to as a “knob”.
This is the base type used to create your knobs control panel!
Normally you'll have a single one of these stored in your model,
but that one knob can actually represent a group of [`compose`](#compose)d knobs.
-}
type Knob a
    = Knob (Config a)


type alias Config a =
    { value : a
    , keepOpen : Bool
    , view : KnobView a
    , encode : Maybe (() -> Json.Encode.Value)
    , decode : Maybe (Json.Decode.Decoder (Knob a))
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
    floatInternal step initial (String.fromFloat initial)


floatInternal : Float -> Float -> String -> Knob Float
floatInternal step initial userInput =
    let
        newValue : Float
        newValue =
            String.toFloat userInput |> Maybe.withDefault initial

        input : () -> Html (Knob Float)
        input () =
            Html.input
                [ Html.Attributes.type_ "number"
                , Html.Attributes.value userInput
                , Html.Attributes.step (String.fromFloat step)
                , Html.Events.onInput (floatInternal step initial)
                ]
                []
    in
    Knob
        { value = newValue
        , keepOpen = False
        , view = SingleView input
        , encode = Just (\() -> Json.Encode.float newValue)
        , decode =
            Just
                (Json.Decode.map (String.fromFloat >> floatInternal step initial)
                    Json.Decode.float
                )
        }


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
    floatConstrainedInternal ( rangeLow, rangeHigh ) step initial (String.fromFloat initial)


floatConstrainedInternal : ( Float, Float ) -> Float -> Float -> String -> Knob Float
floatConstrainedInternal ( rangeLow, rangeHigh ) step initial userInput =
    let
        newValue : Float
        newValue =
            String.toFloat userInput
                |> Maybe.withDefault initial
                |> max rangeLow
                |> min rangeHigh

        input : () -> Html (Knob Float)
        input () =
            Html.input
                [ Html.Attributes.type_ "number"
                , Html.Attributes.value userInput
                , Html.Attributes.step (String.fromFloat step)
                , Html.Events.onInput (floatConstrainedInternal ( rangeLow, rangeHigh ) step initial)
                , Html.Events.onBlur (floatConstrainedInternal ( rangeLow, rangeHigh ) step initial (String.fromFloat newValue))
                ]
                []
    in
    Knob
        { value = newValue
        , keepOpen = False
        , view = SingleView input
        , encode = Just (\() -> Json.Encode.float newValue)
        , decode =
            Just
                (Json.Decode.map
                    (String.fromFloat >> floatConstrainedInternal ( rangeLow, rangeHigh ) step initial)
                    Json.Decode.float
                )
        }


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
    floatSliderInternal range step initial (String.fromFloat initial)


floatSliderInternal : ( Float, Float ) -> Float -> Float -> String -> Knob Float
floatSliderInternal ( rangeLow, rangeHigh ) step initial userInput =
    let
        newValue : Float
        newValue =
            String.toFloat userInput
                |> Maybe.withDefault initial
                |> max rangeLow
                |> min rangeHigh

        input : () -> Html (Knob Float)
        input () =
            Html.div []
                [ Html.input
                    [ Html.Attributes.type_ "range"
                    , Html.Attributes.value userInput
                    , Html.Attributes.min (String.fromFloat rangeLow)
                    , Html.Attributes.max (String.fromFloat rangeHigh)
                    , Html.Attributes.step (String.fromFloat step)
                    , Html.Events.onInput (floatSliderInternal ( rangeLow, rangeHigh ) step initial)
                    ]
                    []
                , Html.div [] [ Html.text (String.fromFloat newValue) ]
                ]
    in
    Knob
        { value = newValue
        , keepOpen = False
        , view = SingleView input
        , encode = Just (\() -> Json.Encode.float newValue)
        , decode =
            Just
                (Json.Decode.map
                    (String.fromFloat >> floatSliderInternal ( rangeLow, rangeHigh ) step initial)
                    Json.Decode.float
                )
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
    intInternal step initial (String.fromInt initial)


intInternal : Int -> Int -> String -> Knob Int
intInternal step initial userInput =
    let
        newValue : Int
        newValue =
            String.toInt userInput |> Maybe.withDefault initial

        input : () -> Html (Knob Int)
        input () =
            Html.input
                [ Html.Attributes.type_ "number"
                , Html.Attributes.value userInput
                , Html.Attributes.step (String.fromInt step)
                , Html.Events.onInput (intInternal step initial)
                ]
                []
    in
    Knob
        { value = newValue
        , keepOpen = False
        , view = SingleView input
        , encode = Just (\() -> Json.Encode.int newValue)
        , decode =
            Just
                (Json.Decode.map (String.fromInt >> intInternal step initial)
                    Json.Decode.int
                )
        }


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
    intConstrainedInternal ( rangeLow, rangeHigh ) step initial (String.fromInt initial)


intConstrainedInternal : ( Int, Int ) -> Int -> Int -> String -> Knob Int
intConstrainedInternal ( rangeLow, rangeHigh ) step initial userInput =
    let
        newValue : Int
        newValue =
            String.toInt userInput
                |> Maybe.withDefault initial
                |> max rangeLow
                |> min rangeHigh

        input : () -> Html (Knob Int)
        input () =
            Html.input
                [ Html.Attributes.type_ "number"
                , Html.Attributes.value userInput
                , Html.Attributes.step (String.fromInt step)
                , Html.Events.onInput (intConstrainedInternal ( rangeLow, rangeHigh ) step initial)
                , Html.Events.onBlur (intConstrainedInternal ( rangeLow, rangeHigh ) step initial (String.fromInt newValue))
                ]
                []
    in
    Knob
        { value = newValue
        , keepOpen = False
        , view = SingleView input
        , encode = Just (\() -> Json.Encode.int newValue)
        , decode =
            Just
                (Json.Decode.map
                    (String.fromInt >> intConstrainedInternal ( rangeLow, rangeHigh ) step initial)
                    Json.Decode.int
                )
        }


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
    intSliderInternal range step initial (String.fromInt initial)


intSliderInternal : ( Int, Int ) -> Int -> Int -> String -> Knob Int
intSliderInternal ( rangeLow, rangeHigh ) step initial userInput =
    let
        newValue : Int
        newValue =
            String.toInt userInput
                |> Maybe.withDefault initial
                |> max rangeLow
                |> min rangeHigh

        input : () -> Html (Knob Int)
        input () =
            Html.div []
                [ Html.input
                    [ Html.Attributes.type_ "range"
                    , Html.Attributes.value userInput
                    , Html.Attributes.min (String.fromInt rangeLow)
                    , Html.Attributes.max (String.fromInt rangeHigh)
                    , Html.Attributes.step (String.fromInt step)
                    , Html.Events.onInput (intSliderInternal ( rangeLow, rangeHigh ) step initial)
                    ]
                    []
                , Html.div [] [ Html.text (String.fromInt newValue) ]
                ]
    in
    Knob
        { value = newValue
        , keepOpen = False
        , view = SingleView input
        , encode = Just (\() -> Json.Encode.int newValue)
        , decode =
            Just
                (Json.Decode.map
                    (String.fromInt >> intSliderInternal ( rangeLow, rangeHigh ) step initial)
                    Json.Decode.int
                )
        }


{-| Creates a small, single-line input field knob for entering text.
`initial` is the text it will be prefilled with.
-}
stringInput : String -> Knob String
stringInput initial =
    let
        input : () -> Html (Knob String)
        input () =
            Html.input
                [ Html.Attributes.type_ "text"
                , Html.Attributes.value initial
                , Html.Events.onInput stringInput
                ]
                []
    in
    Knob
        { value = initial
        , keepOpen = False
        , view = SingleView input
        , encode = Just (\() -> Json.Encode.string initial)
        , decode = Just (Json.Decode.map stringInput Json.Decode.string)
        }


{-| Creates a multiline input field knob for entering text.
You can specify the dimensions of this control by setting the amount of `columns` and `rows`.
`initial` is the text it will be prefilled with.
-}
stringTextarea : { columns : Maybe Int, rows : Maybe Int, initial : String } -> Knob String
stringTextarea config =
    let
        textarea : () -> Html (Knob String)
        textarea () =
            Html.textarea
                [ config.rows
                    |> Maybe.map Html.Attributes.rows
                    |> Maybe.withDefault noAttribute
                , config.columns
                    |> Maybe.map Html.Attributes.cols
                    |> Maybe.withDefault noAttribute
                , Html.Events.onInput (\val -> stringTextarea { config | initial = val })
                ]
                [ Html.text config.initial ]
    in
    Knob
        { value = config.initial
        , keepOpen = False
        , view = SingleView textarea
        , encode = Just (\() -> Json.Encode.string config.initial)
        , decode =
            Just
                (Json.Decode.map
                    (\decodedValue -> stringTextarea { config | initial = decodedValue })
                    Json.Decode.string
                )
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
                , Html.Events.onCheck boolCheckbox
                ]
                []
    in
    Knob
        { value = initial
        , keepOpen = False
        , view = SingleView checkbox
        , encode = Just (\() -> Json.Encode.bool initial)
        , decode = Just (Json.Decode.map boolCheckbox Json.Decode.bool)
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
    selectInternal False config


selectInternal :
    Bool
    ->
        { options : List String
        , toString : a -> String
        , fromString : String -> a
        , initial : a
        }
    -> Knob a
selectInternal keepOpen config =
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
                        selectInternal False { config | initial = config.fromString selectionString }
                    )
                , Html.Events.onFocus (selectInternal True config)
                , Html.Events.onBlur (selectInternal False config)
                ]
                optionElements
    in
    Knob
        { value = config.initial
        , keepOpen = keepOpen
        , view = SingleView selectElement
        , encode = Just (\() -> config.initial |> config.toString |> Json.Encode.string)
        , decode =
            Just
                (Json.Decode.map
                    (\decodedValue ->
                        selectInternal False { config | initial = config.fromString decodedValue }
                    )
                    Json.Decode.string
                )
        }


{-| Represents an RGB color value. Each channel value is a `Float` between 0 and 1.
This is the type that the [`colorPicker`](#colorPicker) knob uses.
-}
type alias Color =
    { red : Float
    , green : Float
    , blue : Float
    }


{-| Creates a color picker input.
Colors are represented using a type alias `Color`,
which is easily [`map`](#map)pable into other color formats for your convenience.
Below is an example mapping it into [avh4/elm-color](/packages/avh4/elm-color/1.0.0/) format.

    -- We set magenta as the initial color.
    Knob.colorPicker { red = 1, green = 0, blue = 1 }
        -- We map it into avh4/elm-color format.
        |> Knob.map (\c -> Color.rgb c.red c.green c.blue)

-}
colorPicker : Color -> Knob Color
colorPicker initial =
    colorPickerInternal False initial (colorToString initial)


colorPickerInternal : Bool -> Color -> String -> Knob Color
colorPickerInternal keepOpen initial userInput =
    let
        newValue : Color
        newValue =
            colorFromString initial userInput

        picker : () -> Html (Knob Color)
        picker () =
            Html.input
                [ Html.Attributes.type_ "color"
                , Html.Attributes.value userInput
                , Html.Events.onInput (colorPickerInternal keepOpen initial)
                , Html.Events.onFocus (colorPickerInternal True initial userInput)
                , Html.Events.onBlur (colorPickerInternal False initial userInput)
                ]
                []
    in
    Knob
        { value = newValue
        , keepOpen = keepOpen
        , view = SingleView picker
        , encode =
            Just
                (\() ->
                    Json.Encode.object
                        [ ( "red", Json.Encode.float newValue.red )
                        , ( "green", Json.Encode.float newValue.green )
                        , ( "blue", Json.Encode.float newValue.blue )
                        ]
                )
        , decode =
            Just
                (Json.Decode.map3
                    (\red green blue ->
                        colorPickerInternal False initial (colorToString { red = red, green = green, blue = blue })
                    )
                    (Json.Decode.field "red" Json.Decode.float)
                    (Json.Decode.field "green" Json.Decode.float)
                    (Json.Decode.field "blue" Json.Decode.float)
                )
        }


{-| Creates a knob for any type, using a custom HTML view that you supply.
You can use this function if there is some kind of knob you need
that is not available in this package, and can't be created by using [`map`](#map)
over a predefined knob.

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
                    , Html.Events.onCheck ourBoolKnob
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
Take a look at the line with `Html.Events.onCheck` and make note of what we're doing:
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

Lastly, one final caveat to take into consideration when writing custom knobs is that
they are not serializable using [`serialize`](Knob#serialize).

-}
custom :
    { value : a
    , view : () -> Html (Knob a)
    }
    -> Knob a
custom config =
    Knob
        { value = config.value
        , keepOpen = False
        , view = SingleView config.view
        , encode = Nothing
        , decode = Nothing
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

Check [the documentation's readme](/packages/agj/elm-knobs/1.2.0/)
for a full demonstration on how to wire things up.

-}
view : (Knob a -> msg) -> Knob a -> Html msg
view =
    viewWithOptions []


{-| The same as [`view`](#view), but you can also specify options that change
the way the knobs panel is rendered. You may pass a `List` of options you can
find in the [`Knob.Option`](Knob.Option) module.

Be aware that these options may change the HTML that is produced or only the CSS
classes that are added to it, so if you don't use [the provided styles](#styles)
and instead use your own, the effect might not be what you expected.

-}
viewWithOptions : List Option -> (Knob a -> msg) -> Knob a -> Html msg
viewWithOptions options toMsg (Knob config) =
    let
        isDetached : Bool
        isDetached =
            List.member OptionDetached options

        maybeAnchor : Maybe Anchor
        maybeAnchor =
            options
                |> List.filterMap
                    (\option ->
                        case option of
                            OptionAnchor anchor ->
                                Just anchor

                            _ ->
                                Nothing
                    )
                |> List.head

        classes : List ( String, Bool )
        classes =
            [ ( "knobs", True )
            , ( anchorClass maybeAnchor, True )
            , ( Internal.Constants.keepOpenCssClass, config.keepOpen )
            , ( "knobs-detached", isDetached )
            ]

        content : List (Html msg)
        content =
            [ if isDetached then
                []

              else
                [ Html.div [ Html.Attributes.class "knobs-icon" ]
                    [ Html.div []
                        [ Html.text "🎛" ]
                    ]
                ]
            , [ Html.div []
                    [ viewInternal toMsg config ]
              ]
            ]
                |> List.concat
    in
    Html.aside [ Html.Attributes.classList classes ]
        content


viewInternal : (Knob a -> b) -> Config a -> Html b
viewInternal mapper config =
    case config.view of
        SingleView v ->
            Html.map mapper (v ())

        StackView vs ->
            vs
                |> List.map (\v -> Html.map mapper (v ()))
                |> Html.div [ Html.Attributes.class "knobs-stack" ]


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

    Knob.int { step = 1, initial = 5 }
        |> Knob.value -- Gets `5`.

-}
value : Knob a -> a
value (Knob config) =
    config.value



-- COMPOSITION


{-| Creates a knob that joins multiple knobs to build up a record
(or actually any data structure you want, depending on the `constructor` argument you pass it!)

Pipe ([`|>`](/packages/elm/core/1.0.5/Basics#%7C%3E)) the knobs into it
using [`stack`](Knob#stack) or [`stackLabel`](Knob#stackLabel) in order to provide the arguments.

    type alias Controls =
        { someNumber : Float
        , anInteger : Int
        }

    aKnob =
        Knob.compose Controls
            -- This knob will map to `someNumber`:
            |> Knob.stack (Knob.float { step = 1, initial = 0 })
            -- This one will map to `anInteger`:
            |> Knob.stack (Knob.int { step = 1, initial = 0 })

Here's how you use it to build up a different data structure, in this case a tuple.
Notice that the number of arguments in the function matches the number of “stacks”.

    anotherKnob =
        Knob.compose (\theFloat theInt -> ( theFloat, theInt ))
            |> Knob.stack (Knob.float { step = 1, initial = 0 })
            |> Knob.stack (Knob.int { step = 1, initial = 0 })

-}
compose : (a -> b) -> Knob (a -> b)
compose constructor =
    Knob
        { value = constructor
        , keepOpen = False
        , view = StackView []
        , encode = Just (\_ -> Json.Encode.null)
        , decode =
            Just
                (Json.Decode.map
                    (\_ -> compose constructor)
                    (Json.Decode.succeed ())
                )
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
            [ viewToList pipe.view
                |> List.map (stackView (\newPipe -> stack (Knob config) newPipe))
            , viewToList config.view
                |> List.map (stackView (\new -> stack new (Knob pipe)))
            ]
                |> List.concat
                |> StackView

        encode : () -> Json.Encode.Value
        encode () =
            Json.Encode.object
                [ ( "cur", Maybe.withDefault (always Json.Encode.null) config.encode () )
                , ( "prev", Maybe.withDefault (always Json.Encode.null) pipe.encode () )
                ]

        decode : Json.Decode.Decoder (Knob b)
        decode =
            Json.Decode.map2 (\new newPipe -> stack new newPipe)
                (Json.Decode.field "cur" (Maybe.withDefault (Json.Decode.fail "err") config.decode))
                (Json.Decode.field "prev" (Maybe.withDefault (Json.Decode.fail "err") pipe.decode))
    in
    Knob
        { value = pipe.value config.value
        , keepOpen = pipe.keepOpen || config.keepOpen
        , view = stackedView
        , encode = Just encode
        , decode = Just decode
        }



-- ORGANIZATION


{-| Attaches a text description next to a knob, as a way to identify what the control is for.

The following example will produce a [`float`](Knob#float) knob described as “x position”.

    Knob.label "x position"
        (Knob.float { step = 1, initial = 0 })

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
        , keepOpen = config.keepOpen
        , view = SingleView labeled
        , encode = config.encode
        , decode = config.decode
        }


{-| Convenience function that unifies the functionality of [`stack`](Knob#stack) and [`label`](Knob#label).

The two examples below produce the same identical result:

    -- This:
    Knob.stackLabel "Some label" someKnob

    -- is the same as:
    Knob.stack (Knob.label "Some label" someKnob)

-}
stackLabel : String -> Knob a -> Knob (a -> b) -> Knob b
stackLabel text knob =
    stack (label text knob)



-- TRANSFORMATION


{-| Analogous to `List.map` or other data structures' `map` function,
you can use this function to convert the value produced by a Knob.

The following example converts a knob that produces an `Int` (i.e. a `Knob Int`)
into one that produces a `String` (i.e. a `Knob String`.) This is achieved
because `String.fromInt` is a function with the type `Int -> String`.

    Knob.int { step = 1, initial = 0 }
        |> Knob.map String.fromInt

-}
map : (a -> b) -> Knob a -> Knob b
map mapper (Knob a) =
    Knob
        { value = mapper a.value
        , keepOpen = a.keepOpen
        , view = SingleView (\() -> viewInternal (map mapper) a)
        , encode = a.encode
        , decode =
            a.decode
                |> Maybe.map (Json.Decode.map (map mapper))
        }



-- SERIALIZATION


{-| Convert a knob's value into an [`elm/json`](/packages/elm/json/) `Value`.
You can then send this out to JavaScript via a port,
and store it using the browser's [Web Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API),
for example. You'll want to use in your update function whenever you get
an updated knob.

    port saveKnobState : Json.Encode.Value -> Cmd msg

    update msg model =
        case msg of
            KnobUpdated updatedKnob ->
                ( { model | knob = updatedKnob }
                , saveKnobState (Knob.serialize updatedKnob)
                )

-}
serialize : Knob a -> Json.Encode.Value
serialize (Knob a) =
    case a.encode of
        Just encode ->
            encode ()

        Nothing ->
            Json.Encode.null


{-| After you have used [`serialize`](Knob#serialize) to store your knob's value somewhere,
the way to get that value back into the knob is this function.
You'll probably want to use it on `init` with the serialized data you get
from flags.

If this function fails to interpret the passed value,
the knob will just retain its initial value.
Also, it works with single, [composed](Knob#compose) or [mapped](Knob#map) knobs,
however, it sadly won't work for [custom](Knob#custom) knobs, so be warned.

Notice that you need to create your knob with initial values normally,
and as a last step use this function to update it with the serialized value.

    init serializedKnob =
        ( { knob =
                Knob.int { step = 1, init = 0 }
                    |> readSerialized serializedKnob
          }
        , Cmd.none
        )

-}
readSerialized : Json.Encode.Value -> Knob a -> Knob a
readSerialized val ((Knob a) as knob) =
    case a.decode of
        Just decode ->
            Json.Decode.decodeValue decode val
                |> Result.withDefault knob

        Nothing ->
            knob



-- INTERNAL


colorFromString : Color -> String -> Color
colorFromString default colorString =
    case String.uncons colorString of
        Just ( '#', rest ) ->
            let
                parse : String -> Maybe Float
                parse str =
                    str
                        |> Hex.fromString
                        |> Result.toMaybe
                        |> Maybe.map (\n -> toFloat n / 255)

                red : Maybe Float
                red =
                    rest
                        |> String.left 2
                        |> parse

                green : Maybe Float
                green =
                    rest
                        |> String.dropLeft 2
                        |> String.left 2
                        |> parse

                blue : Maybe Float
                blue =
                    rest
                        |> String.dropLeft 4
                        |> String.left 2
                        |> parse
            in
            case ( red, green, blue ) of
                ( Just r, Just g, Just b ) ->
                    { red = r, green = g, blue = b }

                _ ->
                    default

        _ ->
            default


colorToString : Color -> String
colorToString color =
    let
        { red, green, blue } =
            color

        toHex : Float -> String
        toHex num =
            floor (num * 255)
                |> Hex.toString
                |> String.padLeft 2 '0'

        colorHex : String
        colorHex =
            toHex red ++ toHex green ++ toHex blue
    in
    "#" ++ colorHex


noAttribute : Html.Attribute msg
noAttribute =
    Html.Attributes.classList []


anchorClass : Maybe Anchor -> String
anchorClass maybeAnchor =
    case maybeAnchor of
        Just AnchorBottomRight ->
            "knobs-anchor-bottom-right"

        Just AnchorTopLeft ->
            "knobs-anchor-top-left"

        Just AnchorTopRight ->
            "knobs-anchor-top-right"

        _ ->
            "knobs-anchor-bottom-left"


css : String
css =
    """
    /* Main container */

    .knobs {
        --separation: 0.5em;

        color: black;
        display: flex;
        font-size: 14px;
        gap: var(--separation);
        max-height: 100vh;
        z-index: 888;
    }

    .knobs:not(.knobs-detached) {
        bottom: 0;
        left: 0;
        position: fixed;
    }

    .knobs.knobs-anchor-bottom-right:not(.knobs-detached) {
        bottom: 0;
        left: unset;
        right: 0;
    }

    .knobs.knobs-anchor-top-left:not(.knobs-detached) {
        bottom: unset;
        top: 0;
    }

    .knobs.knobs-anchor-top-right:not(.knobs-detached) {
        bottom: unset;
        left: unset;
        right: 0;
        top: 0;
    }
    
    /* Panel and icon container */

    .knobs > * {
        background-color: white;
        box-shadow: 0 0 0.4em rgba(0, 0, 0, 0.2);
    }

    /* Panel */

    .knobs > :not(.knobs-icon) {
        display: none;
        padding: calc(3 * var(--separation));
        overflow-y: auto;
    }

    .knobs.knobs-detached > :not(.knobs-icon),
    .knobs:hover > :not(.knobs-icon),
    .knobs.knobs-keep-open > :not(.knobs-icon) {
        display: block;
    }

    /* Icon container */

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

    .knobs:hover > .knobs-icon,
    .knobs.knobs-keep-open > .knobs-icon {
        display: none;
    }

    /* Knobs */

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

    /* The following use of `:has()` is so that browsers that don't support that
       selector may ignore this block.
     */
    .knobs label:has(> input) > input[type="checkbox"] {
        order: -1;
    }

    .knobs input[type="range"] + * {
        color: darkgray;
        text-align: center;
    }
    """
