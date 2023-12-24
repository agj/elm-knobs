module ChapterOtherTypes exposing (Model, chapter, init)

import ElmBook.Chapter exposing (Chapter)
import Knob exposing (Knob)
import KnobDoc exposing (KnobDoc)


chapter =
    ElmBook.Chapter.chapter "Other types"
        |> ElmBook.Chapter.withStatefulComponentList
            [ knobDocToComponent stringInputDoc
            , knobDocToComponent stringTextareaDoc
            , knobDocToComponent boolCheckboxDoc
            , knobDocToComponent selectDoc
            , knobDocToComponent colorPickerDoc
            ]
        |> ElmBook.Chapter.render content


content : String
content =
    """
Knobs for other types.

$stringInput$

$stringTextarea$

$boolCheckbox$

$select$

$colorPicker$
"""
        |> String.replace "$stringInput$" (KnobDoc.toTemplate stringInputDoc)
        |> String.replace "$stringTextarea$" (KnobDoc.toTemplate stringTextareaDoc)
        |> String.replace "$boolCheckbox$" (KnobDoc.toTemplate boolCheckboxDoc)
        |> String.replace "$select$" (KnobDoc.toTemplate selectDoc)
        |> String.replace "$colorPicker$" (KnobDoc.toTemplate colorPickerDoc)


type alias Model =
    { stringInput : Knob String
    , stringTextarea : Knob String
    , boolCheckbox : Knob Bool
    , select : Knob Vegetable
    , colorPicker : Knob Knob.Color
    }


init : Model
init =
    { stringInput = stringInputDoc.init_
    , stringTextarea = stringTextareaDoc.init_
    , boolCheckbox = boolCheckboxDoc.init_
    , select = selectDoc.init_
    , colorPicker = colorPickerDoc.init_
    }


knobDocToComponent =
    KnobDoc.toComponent
        (\sharedModel -> sharedModel.otherTypes)
        (\model sharedModel -> { sharedModel | otherTypes = model })



-- Knob docs


stringInputDoc : KnobDoc String Model
stringInputDoc =
    { name = "stringInput"
    , init_ = Knob.stringInput "Enter text here"
    , code = "Knob.stringInput \"Enter text here\""
    , get = \model -> model.stringInput
    , set = \model new -> { model | stringInput = new }
    , toString = identity
    }


stringTextareaDoc : KnobDoc String Model
stringTextareaDoc =
    { name = "stringTextarea"
    , init_ =
        Knob.stringTextarea
            { cols = Just 40
            , rows = Just 5
            , initial = "Enter text here"
            }
    , code =
        """
        Knob.stringTextarea
            { cols = Just 40
            , rows = Just 5
            , initial = "Enter text here"
            }
        """
    , get = \model -> model.stringTextarea
    , set = \model new -> { model | stringTextarea = new }
    , toString = identity
    }


boolCheckboxDoc : KnobDoc Bool Model
boolCheckboxDoc =
    { name = "boolCheckbox"
    , init_ = Knob.boolCheckbox False
    , code = "Knob.boolCheckbox False"
    , get = \model -> model.boolCheckbox
    , set = \model new -> { model | boolCheckbox = new }
    , toString =
        \v ->
            if v then
                "True"

            else
                "False"
    }


selectDoc : KnobDoc Vegetable Model
selectDoc =
    { name = "select"
    , init_ =
        Knob.select
            { options = [ "Carrot", "Lettuce", "Beet" ]
            , toString = vegetableToString
            , fromString = vegetableFromString
            , initial = Carrot
            }
    , code =
        """
        Knob.select
            { options = [ "Carrot", "Lettuce", "Beet" ]
            , toString = vegetableToString
            , fromString = vegetableFromString
            , initial = Carrot
            }


        type Vegetable
            = Carrot
            | Lettuce
            | Beet


        vegetableToString vegetable =
            case vegetable of
                Carrot ->
                    "Carrot"

                Lettuce ->
                    "Lettuce"

                Beet ->
                    "Beet"


        vegetableFromString string =
            case string of
                "Lettuce" ->
                    Lettuce

                "Beet" ->
                    Beet

                _ ->
                    Carrot
        """
    , get = \model -> model.select
    , set = \model new -> { model | select = new }
    , toString = vegetableToString
    }


type Vegetable
    = Carrot
    | Lettuce
    | Beet


vegetableToString vegetable =
    case vegetable of
        Carrot ->
            "Carrot"

        Lettuce ->
            "Lettuce"

        Beet ->
            "Beet"


vegetableFromString string =
    case string of
        "Lettuce" ->
            Lettuce

        "Beet" ->
            Beet

        _ ->
            Carrot


colorPickerDoc : KnobDoc Knob.Color Model
colorPickerDoc =
    { name = "colorPicker"
    , init_ = Knob.colorPicker { red = 1, green = 1, blue = 1 }
    , code = "Knob.colorPicker { red = 1, green = 1, blue = 1 }"
    , get = \model -> model.colorPicker
    , set = \model new -> { model | colorPicker = new }
    , toString =
        \{ red, green, blue } ->
            "{ red = $red$, green = $green$, blue = $blue$ }"
                |> String.replace "$red$" (roundToString red)
                |> String.replace "$green$" (roundToString green)
                |> String.replace "$blue$" (roundToString blue)
    }


roundToString : Float -> String
roundToString float =
    toFloat (round (float * 100))
        / 100
        |> String.fromFloat
