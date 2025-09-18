module Util.TestKnob exposing (..)

import Dict exposing (Dict)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer)
import Html
import Internal.Utils
import Json.Decode exposing (Value)
import Json.Encode
import Knob exposing (Knob)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector as Selector exposing (Selector)



-- KNOB PRODUCTION


knobSelect :
    Vegetable
    ->
        { knob : Knob Vegetable
        , fromString : String -> Vegetable
        , toString : Vegetable -> String
        }
knobSelect initial =
    { knob =
        Knob.select
            { options = vegetableOptions
            , initial = initial
            }
    , fromString = vegetableFromString >> Maybe.withDefault initial
    , toString = vegetableToString
    }


type Vegetable
    = Carrot
    | Lettuce
    | Beet


vegetableOptions : Dict String Vegetable
vegetableOptions =
    [ ( "Carrot", Carrot )
    , ( "Lettuce", Lettuce )
    , ( "Beet", Beet )
    ]
        |> Dict.fromList


vegetables : List Vegetable
vegetables =
    Dict.values vegetableOptions


vegetableStrings : List String
vegetableStrings =
    Dict.keys vegetableOptions


vegetableToString : Vegetable -> String
vegetableToString vegetable =
    Dict.toList vegetableOptions
        |> Internal.Utils.listFind (\( _, v ) -> v == vegetable)
        |> Maybe.map (\( k, _ ) -> k)
        |> Maybe.withDefault ""


vegetableFromString : String -> Maybe Vegetable
vegetableFromString string =
    vegetableOptions
        |> Dict.get string


knobCustomBoolSerializable : Bool -> Knob Bool
knobCustomBoolSerializable initial =
    let
        view () =
            Html.text ""
    in
    Knob.custom
        { value = initial
        , view = view
        , serialization =
            Just
                { encode = \() -> Json.Encode.bool initial
                , decoder = Json.Decode.map knobCustomBoolSerializable Json.Decode.bool
                }
        }



-- FUZZERS


fuzzColor : Fuzzer Knob.Color
fuzzColor =
    Fuzz.map3
        (\r g b -> { red = r, green = g, blue = b })
        fuzzColorChannel
        fuzzColorChannel
        fuzzColorChannel


{-| Generates a float value between 0 and 1, but constrained to 255 possible
values, to make it directly map to a two-digit hexadecimal integer
representation. This is to make serialization tests work.
-}
fuzzColorChannel : Fuzzer Float
fuzzColorChannel =
    Fuzz.floatRange 0 1
        |> Fuzz.map (\n -> toFloat (floor (n * 0xFF)) / 0xFF)



-- INPUT


{-| Simulates entering some text into the knob's `<input>` element, and returns
a `Maybe` of the value that the knob emits out of the interaction.
-}
simulateInput : String -> Knob a -> Maybe a
simulateInput inputString knob =
    knob
        |> simulateEvent "input" (Event.input inputString)
        |> Maybe.map Knob.value


{-| Same as `simulateInput`, but simulates a sequence of inputs instead of just
one. The first input is required, the rest are supplied as an array.
-}
simulateInputs : String -> List String -> Knob a -> Maybe a
simulateInputs firstInputString restInputStrings =
    simulateEvents "input" (Event.input firstInputString) (List.map Event.input restInputStrings)
        >> Maybe.map Knob.value


{-| The same as `simulateInput`, but the element is `<textarea>`.
-}
simulateTextareaInput : String -> Knob a -> Maybe a
simulateTextareaInput inputString knob =
    knob
        |> simulateEvent "textarea" (Event.input inputString)
        |> Maybe.map Knob.value


simulateCheckInput : Bool -> Knob Bool -> Maybe Bool
simulateCheckInput input knob =
    knob
        |> simulateEvent "input" (Event.check input)
        |> Maybe.map Knob.value


simulateSelectInput : String -> Knob a -> Maybe a
simulateSelectInput input knob =
    knob
        |> simulateEvent "select" (Event.input input)
        |> Maybe.map Knob.value


simulateSelectInputs : String -> List String -> Knob a -> Maybe a
simulateSelectInputs firstInputString restInputStrings knob =
    let
        proc : String -> Maybe (Knob a) -> Maybe (Knob a)
        proc inputString =
            Maybe.andThen (simulateEvent "select" (Event.input inputString))
    in
    List.foldl
        proc
        (Just knob)
        (firstInputString :: restInputStrings)
        |> Maybe.map Knob.value


simulateEvent : String -> ( String, Value ) -> Knob a -> Maybe (Knob a)
simulateEvent tag event knob =
    knob
        |> Knob.view [] identity
        |> Query.fromHtml
        |> Query.find [ Selector.tag tag ]
        |> Event.simulate event
        |> Event.toResult
        |> Result.toMaybe


simulateEvents : String -> ( String, Value ) -> List ( String, Value ) -> Knob a -> Maybe (Knob a)
simulateEvents tag firstEvent restEvents knob =
    let
        proc : ( String, Value ) -> Maybe (Knob a) -> Maybe (Knob a)
        proc currentEvent =
            Maybe.andThen (simulateEvent tag currentEvent)
    in
    List.foldl
        proc
        (Just knob)
        (firstEvent :: restEvents)


viewHas : List Selector -> Knob a -> Expectation
viewHas selectors =
    queryView >> Query.has selectors


viewHasNot : List Selector -> Knob a -> Expectation
viewHasNot selectors =
    queryView >> Query.hasNot selectors


queryView : Knob a -> Query.Single (Knob a)
queryView knob =
    knob
        |> Knob.view [] identity
        |> Query.fromHtml


afterEvent : (Knob a -> Expectation) -> Maybe (Knob a) -> Expectation
afterEvent expect maybeKnob =
    maybeKnob
        |> Maybe.map expect
        |> Maybe.withDefault (Expect.fail "Event did not trigger.")
