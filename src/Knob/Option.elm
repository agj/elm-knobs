module Knob.Option exposing
    ( Option
    , anchorBottomLeft, anchorBottomRight, anchorTopLeft, anchorTopRight
    , detached
    )

{-|

@docs Option


# Anchoring

Options that determine where in the page the knobs panel will be placed.

@docs anchorBottomLeft, anchorBottomRight, anchorTopLeft, anchorTopRight
@docs detached

-}

import Internal.Option exposing (Anchor(..), Option(..))


{-| An option that [`Knob.viewWithOptions`](Knob#viewWithOptions) receives,
which changes how the knobs panel is rendered.
-}
type alias Option =
    Internal.Option.Option


{-| Sticks the knobs panel to the bottom-left corner of the viewport. This is the
default placement.
-}
anchorBottomLeft : Option
anchorBottomLeft =
    OptionAnchor AnchorBottomLeft


{-| Sticks the knobs panel to the bottom-right corner of the viewport.
-}
anchorBottomRight : Option
anchorBottomRight =
    OptionAnchor AnchorBottomRight


{-| Sticks the knobs panel to the top-left corner of the viewport.
-}
anchorTopLeft : Option
anchorTopLeft =
    OptionAnchor AnchorTopLeft


{-| Sticks the knobs panel to the top-right corner of the viewport.
-}
anchorTopRight : Option
anchorTopRight =
    OptionAnchor AnchorTopRight


{-| Makes the panel not fixed to a corner of the viewport, but instead render
within the flow of the DOM, always visible.
-}
detached : Option
detached =
    OptionDetached
