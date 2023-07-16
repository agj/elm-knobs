# elm-knobs changelog

Details on all elm-knobs releases. The format is roughly based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

[Unreleased]: https://github.com/agj/elm-knobs/compare/1.0.0..HEAD

### Added

- Knobs: `boolCheckbox`, `select`, `colorPicker`.
- A way to transform knobs (`map`.)
- A way to create your own custom knob (`custom`.)
- This changelog.

### Fixed

- Fix style leak for `<input type="range">` sibling elements.

---

## [1.0.0] (2023-04-30)

[1.0.0]: https://github.com/agj/elm-knobs/tree/1.0.0

### Added

- Knobs: `float`, `floatConstrained`, `floatSlider`, `int`, `intConstrained`, `intSlider`.
- A way to render knobs (`view`, `style`.)
- A way to get the value out of a knob (`value`.)
- A way to compose knobs (`compose`, `stack`.)
- A way to organize knobs (`label`, `stackLabel`.)
