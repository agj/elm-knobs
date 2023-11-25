module ChapterIntroduction exposing (..)

import ElmBook exposing (Msg)
import ElmBook.Chapter exposing (Chapter)


chapter =
    ElmBook.Chapter.chapter "Introduction"
        |> ElmBook.Chapter.render content


content : String
content =
    """
This is the interactive documentation for elm-knobs.
"""
