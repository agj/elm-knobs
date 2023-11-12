module ChapterIntroduction exposing (..)

import ElmBook.Chapter exposing (Chapter)


chapter : Chapter x
chapter =
    ElmBook.Chapter.chapter "Introduction"
        |> ElmBook.Chapter.render content


content : String
content =
    """
# Introduction

This is the interactive documentation for elm-knobs.
"""
