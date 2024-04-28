module Internal.Option exposing (..)


type Option
    = OptionDetached
    | OptionAnchor Anchor


type Anchor
    = AnchorBottomLeft
    | AnchorBottomRight
    | AnchorTopLeft
    | AnchorTopRight
