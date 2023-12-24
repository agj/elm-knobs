# elm-knobs Web Storage API example

This example uses [ports][ports] and some JavaScript to save and read serialized knob data using the [Web Storage API][webstorage]. This means that you can refresh the page and the knob's state will remain as it was set last time.

The `Main.elm` file, of course, contains the most important part, and within the `index.html` file you'll find a `<script>` tag with the JavaScript boilerplate that interfaces with the Web Storage API.

[ports]: https://github.com/evancz/guide.elm-lang.org/blob/a6030f9968724629c374b936c552d2b8d2b30f31/book/interop/ports.md
[webstorage]: https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API

# How to run

Make sure you have Elm 0.19.1 or above installed, get this repo, navigate to this folder and run the following command.

```sh
elm make Main.elm --output=main.js
```

This will compile the Elm code. After that you can open the `index.html` file in your web browser and try it out.
