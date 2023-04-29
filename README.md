# elm-knobs

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/agj/elm-knobs/CI.yaml?branch=main&style=flat-square)](https://github.com/agj/elm-knobs/actions/workflows/CI.yaml)
[![Elm package](https://img.shields.io/elm-package/v/agj/elm-knobs?style=flat-square)](https://package.elm-lang.org/packages/agj/elm-knobs/latest)

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

```
module Main exposing (main)

import Knob exposing (Knob)

main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }

type alias Model =
    { knob : Knob Int }

init =
    { knob = Knob.int { step = 1, initial = 0 } }


```

