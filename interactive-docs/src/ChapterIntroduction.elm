module ChapterIntroduction exposing (chapter)

import Constants
import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)


chapter =
    ElmBook.Chapter.chapter "What this is"
        |> ElmBook.Chapter.render content


content : String
content =
    """
This is the interactive documentation for the [agj/**elm-knobs**
$elmKnobsVersion$ Elm package][package]. This documentation contains interactive
examples of the knobs, so that you can see them in action in your browser.
Select a section from the menu on the left to jump to the examples.

The package offers a way to easily tweak values interactively within a running
Elm app, using a panel of input controls that map to those values, which we call
“knobs” here. While not in use, they recede to an icon in the lower-left corner.
For a full explanation of the package and its functionality, [see the API
docs][package].

[package]: $apiDocsUrl$
"""
        |> String.replace "$elmKnobsVersion$" Constants.elmKnobsVersion
        |> String.replace "$apiDocsUrl$" Constants.apiDocsUrl
