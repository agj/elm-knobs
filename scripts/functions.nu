
export def getCurrentVersion [] {
  open elm.json | get 'version'
}

export def getExamples [] {
  glob ./examples/* --no-file --exclude [elm-stuff, .*]
    | each { |dir|
      let folderName = $dir | split row '/' | last
      { dir: $dir, name: $folderName }
    }
}

export def minifyHtml [file] {
  (^pnpm exec html-minifier-terser --collapse-whitespace --remove-comments --remove-tag-whitespace --minify-css=true --minify-js=true $file)
}
