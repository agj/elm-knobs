module ChapterIntroduction exposing (..)

import Constants
import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)


chapter =
    ElmBook.Chapter.chapter "Introduction"
        |> ElmBook.Chapter.render content


content : String
content =
    """
This is the interactive documentation for the [**elm-knobs** v$elmKnobsVersion$
Elm package][package]. Follow that link for a full explanation of the package
and its functionality. This documentation contains interactive examples of the
“knobs” contained in it, so that you can see them in action in your own browser.

[package]: https://package.elm-lang.org/packages/agj/elm-knobs/1.1.0
"""
        |> String.replace "$elmKnobsVersion$" Constants.elmKnobsVersion
