# This script generates the example code string automatically from the code
# itself.

# We need to match the entire KnobDoc record, but we only want to change the
# middle part, so we have the top and bottom parts as constants.

let docRecordTop = (
    '{ name = :[name]
    , link = :[link]
    , description = :[description]'
)
let docRecordBottom = (
    ', get = :[get]
    , set = :[set]
    , toString = :[toString]
    }'
)

print $"ℹ️ Updating example code strings"

# Copy knob example code into the code string.

(comby -in-place
    # Matching pattern:
    ($docRecordTop + '
    , init_ = :[init]
    , code = ...
    ' + $docRecordBottom)
    # Replacement pattern:
    ($docRecordTop + '
    , init_ = :[init]
    , code =
        """
        :[init]
        """
    ' + $docRecordBottom)
    ./interactive-docs/src/**/*.elm)

# Escape backslashes in code string.

(comby -in-place
    # Matching pattern:
    ($docRecordTop + '
    , init_ = :[init]
    , code = """:[code]"""
    ' + $docRecordBottom)
    # Replacement pattern:
    ($docRecordTop + '
    , init_ =
        :[init]
    , code =
        """:[code]"""
    ' + $docRecordBottom)
    # Rewrite rule (actual escaping).
    -rule 'where rewrite :[code] { "\\" -> "\\\\" }'
    ./interactive-docs/src/**/*.elm)

# Reformat files.

elm-format --yes ./interactive-docs/src/**/*.elm
