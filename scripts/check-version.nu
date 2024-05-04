use functions.nu getCurrentVersion

print "ℹ️ Checking package version consistency…"

let currentVersion = getCurrentVersion
mut errors = []

print $"ℹ️ Current version: ($currentVersion)"

def checkHasCurrentVersion [place versions errors] {
  print $"🔍 Checking that ($place) has the current version…"
  if ($currentVersion not-in $versions) {
    print $"❌ Current version not found."
    $errors | prepend $place
  } else {
    $errors
  }
}

def checkHasOutdatedVersion [place versions errors] {
  let outdatedVersions = $versions
    | filter { $in != $currentVersion }
  print $"🔍 Checking if outdated versions remain in ($place)…"
  if ($outdatedVersions | length | $in > 0) {
    print $"❌ Outdated versions found in ($place)."
    print $outdatedVersions
    $errors | prepend $place
  } else {
    $errors
  }
}

def getVersionsUsedInLinks [filesGlob] {
  open $filesGlob
    | split row "\n"
    | each { parse --regex 'elm-knobs/([a-z0-9]+/)?([0-9.]+)' }
    | filter { length | $in > 0 }
    | each { get 0 | get capture1 }
}

# Changelog

let allVersionsInChangelog = open CHANGELOG.md
  | split row "\n"
  | each { parse --regex '^## \[([0-9.]+)\]' }
  | filter { length | $in > 0 }
  | each { get 0 | get capture0 }

$errors = (checkHasCurrentVersion "changelog" $allVersionsInChangelog $errors)

# Git tags

let allVersionsInGitTags = (^git tag)
  | split row "\n"
  | find --regex '^[0-9.]+$'

$errors = (checkHasCurrentVersion "git tags" $allVersionsInGitTags $errors)

# Links in code

let allVersionsInCode = getVersionsUsedInLinks ./src/*.elm

$errors = (checkHasOutdatedVersion "code" $allVersionsInCode $errors)

# Links in readme

let allVersionsInReadme = getVersionsUsedInLinks ./README.md

$errors = (checkHasOutdatedVersion "readme" $allVersionsInReadme $errors)

# Interactive docs version

let versionInInteractiveDocs = open ./interactive-docs/src/Constants.elm
  | parse --regex '    "([0-9.]+)"'
  | get capture0
  | first

$errors = (checkHasCurrentVersion "interactive docs" $versionInInteractiveDocs $errors)

# Interactive docs file

let gitHasInteractiveDocsCurrentVersionFileCheck = $"($currentVersion):./interactive-docs/output/($currentVersion)/index.html"
  | do { ^git cat-file -e $in }
  | complete

print "🔍 Checking if there is interactive documentation for the current version…"

if ($gitHasInteractiveDocsCurrentVersionFileCheck | get exit_code) != 0 {
  print "❌ Interactive documentation for the current version not found in git."
  $errors = $errors | prepend "interactive documentation"
}


if (($errors | length) > 0) {
  exit 1
} else {
  print "✅ Current version checks OK."
}
