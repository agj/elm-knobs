
comby -in-place '
    { name = :[name]
    , link = :[link]
    , description = :[description]
    , init_ = :[init]
    , code = :[code]
    , get = :[get]
    , set = :[set]
    , toString = :[toString]
    }' '
    { name = :[name]
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
    }' ./interactive-docs/src/**/*.elm

