# elm-knobs LocalStorage example

This example uses [ports][ports] and some JavaScript to save and read serialized knob data using the [LocalStorage API][localstorage]. This means that you can refresh the page and the knob's state will remain as it was set last time.

The `Main.elm` file, of course, contains the most important part, and within the `index.html` file you'll find a `<script>` tag with the JavaScript boilerplate that interfaces with LocalStorage.

[ports]: https://github.com/evancz/guide.elm-lang.org/blob/a6030f9968724629c374b936c552d2b8d2b30f31/book/interop/ports.md
[localstorage]: https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage

# How to run

Make sure you have Elm 0.19.1 or above installed, get this repo, navigate to this folder and run the following command.

```sh
elm make Main.elm --output=main.js
```

This will compile the Elm code. After that you can open the `index.html` file in your web browser and try it out.
