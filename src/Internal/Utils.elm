module Internal.Utils exposing (listFind)


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
