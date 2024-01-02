# elm-knobs 🎛

[![Elm package](https://img.shields.io/elm-package/v/agj/elm-knobs?style=flat-square&logo=elm&labelColor=white&color=%231293D8)](https://package.elm-lang.org/packages/agj/elm-knobs/latest)

A way to easily tweak values interactively within a running Elm app,
using a panel of input controls that map to those values, which we call “knobs” here.
While not in use, they recede to an icon in the lower-left corner.
The library supports easy serialization, enabling you to persist the values even after a page refresh by, for example, interfacing with the [Web Storage API][webstorage].

[webstorage]: https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API

![Example of elm-knobs in action](https://raw.githubusercontent.com/agj/elm-knobs/d2167d12ded679174e6678b2de29b9132ffac104/examples/polygon-example.png)

## Links

- [API docs (package.elm-lang.org).][docs]
- [Interactive docs.][interactive-docs]
- [Code examples.][examples]

[docs]: https://package.elm-lang.org/packages/agj/elm-knobs/1.1.0
[interactive-docs]: https://agj.github.io/elm-knobs/1.1.0/
[examples]: https://github.com/agj/elm-knobs/blob/1.1.0/examples/

## Why?

Sometimes it's hard to find the right value for something in your design,
and having actual controls in the browser that instantly update the view helps tremendously in the development process.
It also enables non-technical people to explore how things change when different values are used,
with immediate feedback.

Since its intended use case is aiding the development process and facilitating rough prototypes,
visual customization is not a priority,
but you can still define your own CSS styles to customize how it looks.

## What it looks like to use elm-knobs

Below is a very basic yet complete example of using elm-knobs.
It is not what is shown at the top of this page, though,
but you can [find that and other examples in the Github repo][examples].

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
        -- Use the knob value within the view:
        [ Html.text (String.fromInt (Knob.value model.knob))

        -- Display the knob controls:
        , Knob.view KnobUpdated model.knob
        , Knob.styles
        ]
```

## Not exactly what you were looking for?

For a more complete package that does much more than elm-knobs, at the cost of setup complexity, try [jamesgary/elm-config-ui](https://package.elm-lang.org/packages/jamesgary/elm-config-ui/latest/).

Also check out [avh4/elm-debug-controls](https://package.elm-lang.org/packages/avh4/elm-debug-controls/latest/), a library with some overlap with this one, and whose source code inspired my approach to building this library.
