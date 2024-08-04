def makeDocRecordPattern [codePattern] {
    $"{ name = :[name]
    , link = :[link]
    , description = :[description]
    , init_ = :[init]
    , code = ($codePattern)
    , get = :[get]
    , set = :[set]
    , toString = :[toString]
    }"
}

(comby -in-place
    (makeDocRecordPattern ":[code]")
    # Replacement pattern:
    '{ name = :[name]
    , link = :[link]
    , description = :[description]
    , init_ =
        :[init]
    , code =
        """
        :[init]
        """
    , get = :[get]
    , set = :[set]
    , toString = :[toString]
    }'
    ./interactive-docs/src/**/*.elm)

(comby -in-place
    (makeDocRecordPattern '""":[code]"""')
    # Replacement pattern:
    '{ name = :[name]
    , link = :[link]
    , description = :[description]
    , init_ =
        :[init]
    , code =
        """:[code]"""
    , get = :[get]
    , set = :[set]
    , toString = :[toString]
    }'
    # Escape backslashes in code string.
    -rule 'where rewrite :[code] { "\\" -> "\\\\" }'
    ./interactive-docs/src/**/*.elm)

elm-format --yes ./interactive-docs/src/**/*.elm
