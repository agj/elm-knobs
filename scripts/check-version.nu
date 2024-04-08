
print "ℹ️ Checking package version consistency…"

let currentVersion = open elm.json | get 'version'

print $"ℹ️ Current version: ($currentVersion)"

def checkHasCurrentVersion [place versions] {
  print $"🔍 Checking that ($place) has the current version…"
  if ($currentVersion not-in $versions) {
    print $"❌ Current version not found."
    exit 1
  }
}

def checkHasOutdatedVersion [place versions] {
  let outdatedVersions = $versions
    | filter { $in != $currentVersion }
  print $"🔍 Checking if outdated versions remain in ($place)…"
  if ($outdatedVersions | length | $in > 0) {
    print $"❌ Outdated versions found in ($place)."
    print $outdatedVersions
    exit 1
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

checkHasCurrentVersion "changelog" $allVersionsInChangelog

# Git tags

let allVersionsInGitTags = (^git tag)
  | split row "\n"
  | find --regex '^[0-9.]+$'

checkHasCurrentVersion "git tags" $allVersionsInGitTags

# Links in code

let allVersionsInCode = getVersionsUsedInLinks ./src/*.elm

checkHasOutdatedVersion "code" $allVersionsInCode

# Links in readme

let allVersionsInReadme = getVersionsUsedInLinks ./README.md

checkHasOutdatedVersion "readme" $allVersionsInReadme


print "✅ Current version is OK."
