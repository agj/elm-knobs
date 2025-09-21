module Internal.Utils exposing (listFind, showIf)

import Html exposing (Html)


listFind : (a -> Bool) -> List a -> Maybe a
listFind predicate list =
    case list of
        cur :: rest ->
            if predicate cur then
                Just cur

            else
                listFind predicate rest

        [] ->
            Nothing


showIf : Bool -> Html msg -> Html msg
showIf condition element =
    if condition then
        element

    else
        Html.text ""
