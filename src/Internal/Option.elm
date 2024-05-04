module Internal.Option exposing (Anchor(..), Option(..))


type Option
    = OptionDetached
    | OptionAnchor Anchor


type Anchor
    = AnchorBottomLeft
    | AnchorBottomRight
    | AnchorTopLeft
    | AnchorTopRight
