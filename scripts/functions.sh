#!/usr/bin/env bash

getCurrentVersion() {
  awk -F '"' '/"version":/ {print $4}' elm.json | head --lines=1
}

getAllVersionsInChangelog() {
  grep -E '## \[[0-9.]+\]' CHANGELOG.md | sed -E 's/^.*\[(.+)\].*$/\1/'
}

getAllVersionsInGit() {
  git tag | grep -E '^[0-9.]+$'
}

getVersionsUsedInLinks() {
  grep -E \
    -e 'elm-knobs/([a-z0-9]+/)?[0-9.]+' \
    "$@" \
  | sed -E 's/^.*[/]([0-9.]+)[/].*$/\1/'
}
