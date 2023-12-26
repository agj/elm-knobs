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
and its functionality. This documentation only contains interactive examples of the
“knobs” contained in it, so that you can see them in action in your browser.

[package]: $apiDocsUrl$
"""
        |> String.replace "$elmKnobsVersion$" Constants.elmKnobsVersion
        |> String.replace "$apiDocsUrl$" Constants.apiDocsUrl
