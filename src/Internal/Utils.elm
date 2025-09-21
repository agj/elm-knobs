module Internal.Utils exposing (expectAll, listFind, noAttribute, showIf)

import Expect exposing (Expectation)
import Html exposing (Html)
import Html.Attributes


expectAll : List Expectation -> Expectation
expectAll expectations =
    Expect.all
        (expectations |> List.map (\expectation _ -> expectation))
        ()


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


noAttribute : Html.Attribute msg
noAttribute =
    Html.Attributes.classList []
