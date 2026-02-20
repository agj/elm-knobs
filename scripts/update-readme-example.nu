# Updates the readme example code by copying it from the "basic" example file.

let basicExampleCode = open ./examples/basic/Main.elm

open ./README.md
  | str replace --multiline --regex '```elm(.|\n)*```' $"```elm\n($basicExampleCode)```"
  | save --force ./README.md

