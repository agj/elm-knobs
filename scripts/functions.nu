
export def getCurrentVersion [] {
  open elm.json | get 'version'
}
