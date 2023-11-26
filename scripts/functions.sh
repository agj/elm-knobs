#!/usr/bin/env bash

getCurrentVersion() {
  awk -F '"' '/"version":/ {print $4}' elm.json | head --lines=1
}

getAllVersionsInChangelog() {
  grep -E '## \[[.[:digit:]]+\]' CHANGELOG.md | sed -E 's/^.*\[(.+)\].*$/\1/'
}

getAllVersionsInGit() {
  git tag | grep -E '^[.[:digit:]]+$'
}
