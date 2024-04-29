
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
