
(comby -in-place
    # Pattern to match:
    '{ name = :[name]
    , link = :[link]
    , description = :[description]
    , init_ = :[init]
    , code = :[code]
    , get = :[get]
    , set = :[set]
    , toString = :[toString]
    }'
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
    # Escape backslashes:
    -rule 'where rewrite :[init] { "\\" -> "\\\\" }'
    # Input:
    ./interactive-docs/src/**/*.elm)

