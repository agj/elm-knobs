# elm-knobs changelog

Details on all elm-knobs releases. The format is roughly based on [Keep a
Changelog](https://keepachangelog.com/en/1.1.0/).

## Unreleased

### Added

- Each knob type now gets its own specific CSS class, to make it easier
  to style.

### Changed

- `view` now takes options as its first parameter, replacing the need for
  `viewWithOptions`.
- `select` has been simplified to only take a list of options. The functions
   `toString` and `fromString` are no longer needed.
- `custom` now supports serialization.
- HTML for the panel was changed slightly, mostly in the tags and CSS classes
  used.
- Default CSS styles (provided by `Knob.styles`) were changed to use system
  colors and root element font size. Also added CSS variables that make it
  easier to customize.

### Removed

- `viewWithOptions` has been removed. Use `view` instead.

## [1.2.0] (2024-05-04)

[1.2.0]: https://github.com/agj/elm-knobs/tree/1.2.0

### Added

- Knobs for strings: `stringInput`, `stringTextarea`.
- Knob serialization with `serialize` and `readSerialized`.
- A way to customize some aspects of the view using `viewWithOptions`. This
  includes the ability to not have the panel stuck to a corner.
- Interactive documentation.
- A serialization example using the Web Storage API.
- Unit tests for all knobs.

### Fixed

- Incorrect input in some knobs resulted in the last correct value. Now it
  results in the initial value.

## [1.1.0] (2023-07-16)

[1.1.0]: https://github.com/agj/elm-knobs/tree/1.1.0

### Added

- Knobs: `boolCheckbox`, `select`, `colorPicker`.
- A way to transform knobs (`map`.)
- A way to create your own custom knob (`custom`.)
- This changelog.

### Fixed

- Fix style leak for `<input type="range">` sibling elements.

## [1.0.0] (2023-04-30)

[1.0.0]: https://github.com/agj/elm-knobs/tree/1.0.0

### Added

- Knobs: `float`, `floatConstrained`, `floatSlider`, `int`, `intConstrained`, `intSlider`.
- A way to render knobs (`view`, `style`.)
- A way to get the value out of a knob (`value`.)
- A way to compose knobs (`compose`, `stack`.)
- A way to organize knobs (`label`, `stackLabel`.)
