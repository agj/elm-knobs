module Knob.Option exposing (Option, detached)

import Internal.Option exposing (Option(..))


type alias Option =
    Internal.Option.Option


detached : Option
detached =
    OptionDetached
