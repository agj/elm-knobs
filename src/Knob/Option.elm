module Knob.Option exposing (Option, anchorBottomLeft, anchorBottomRight, anchorTopLeft, anchorTopRight, detached)

import Internal.Option exposing (Anchor(..), Option(..))


type alias Option =
    Internal.Option.Option


anchorBottomLeft : Option
anchorBottomLeft =
    OptionAnchor AnchorBottomLeft


anchorBottomRight : Option
anchorBottomRight =
    OptionAnchor AnchorBottomRight


anchorTopLeft : Option
anchorTopLeft =
    OptionAnchor AnchorTopLeft


anchorTopRight : Option
anchorTopRight =
    OptionAnchor AnchorTopRight


detached : Option
detached =
    OptionDetached
