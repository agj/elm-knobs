let patternToMatch = '
    { name = :[name]
    , link = :[link]
    , description = :[description]
    , init_ = :[init]
    , code = :[code]
    , get = :[get]
    , set = :[set]
    , toString = :[toString]
    }'

(comby -in-place
    $patternToMatch
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
    '{ name = :[name]
    , link = :[link]
    , description = :[description]
    , init_ = :[init]
    , code = """:[code]"""
    , get = :[get]
    , set = :[set]
    , toString = :[toString]
    }'
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
    -rule 'where rewrite :[code] { "\\" -> "\\\\" }'
    ./interactive-docs/src/**/*.elm)

elm-format --yes ./interactive-docs/src/**/*.elm
