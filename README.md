# elm-knobs

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/agj/elm-knobs/CI.yaml?branch=main&style=flat-square)](https://github.com/agj/elm-knobs/actions/workflows/CI.yaml)
[![Elm package](https://img.shields.io/elm-package/v/agj/elm-knobs?style=flat-square)](https://package.elm-lang.org/packages/agj/elm-knobs/latest)

![Example of this package in action](https://raw.githubusercontent.com/agj/elm-knobs/3ea0194d043a6105ef15430369c5015e7993d00d/examples/polygon-example.png)

This package was made as a way to easily tweak values interactively within an Elm app,
using input controls mapping to values, which here we call “knobs”.

Sometimes it's hard to find the right value for something in your design,
and having actual controls in the browser that instantly update the view helps tremendously
in the development process.
It also enables non-technical people to explore how things change when different values are used,
with immediate feedback.

Since its main use case is aiding the development process,
visual customization is not a priority,
but you can still define your own CSS styles to define how you want the controls to look.

Here's a very basic example of how it looks to use this package:

```elm
module BasicExample exposing (main)

import Browser
import Html
import Knob exposing (Knob)


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    -- Put the knob in the model:
    { knob : Knob Int }


type
    Msg
    -- Create a message for knob updates:
    = KnobUpdated (Knob Int)


init =
    -- Initialize the knob:
    { knob =
        Knob.int
            { step = 1
            , initial = 0
            }
    }


update msg model =
    case msg of
        -- Update the knob state:
        KnobUpdated knobState ->
            { knob = knobState }


view model =
    Html.div []
        -- Display the knob value somewhere within the view:
        [ Html.text (String.fromInt (Knob.value model.knob))

        -- Display the knob controls:
        , Knob.view KnobUpdated model.knob
        , Knob.styles
        ]
```

The picture at the top is a more involved example, though.
You can take a look at it in the [Github repo][in-github], in the `examples/src/PolygonExample.elm` file,
or [play with it directly in your browser][in-elm-editor] thanks to the magic of Elm Editor.

[in-github]: https://github.com/agj/elm-knobs
[in-elm-editor]: https://elm-editor.com/?project-state=https://github.com/agj/elm-knobs
