#!/usr/bin/env bash

source './scripts/functions.sh'

currentVersion=$(getCurrentVersion)

echo "Validating package version consistency."
echo "Current version: $currentVersion"
echo

changelogHasCurrentVersion=$(getAllVersionsInChangelog | grep -F "$currentVersion")

if [ -z "$changelogHasCurrentVersion" ]
then
  echo "Error: Changelog doesn't have an entry for the current version!"
  exit 1
fi

allVersionsInGit=$(getAllVersionsInGit)
gitHasCurrentVersion=$(echo "$allVersionsInGit" | grep -F "$currentVersion")

if [ -z "$gitHasCurrentVersion" ]
then
  echo "Error: There is no git tag for the current version!"
  exit 1
fi

versionInLinks=$(
  grep -E \
    -e 'packages/agj/elm-knobs/[[:digit:].]+/' \
    -e 'github.com/agj/elm-knobs/blob/[[:digit:].]+/' \
    src/Knob.elm ./README.md \
  | sed -E 's/^.*[/]([[:digit:].]+)[/].*$/\1/'
) 

linksWithoutCurrentVersion=$(echo "$versionInLinks" | grep -vF "$currentVersion")

if [ "$linksWithoutCurrentVersion" ]
then
  echo "Error: There are links that point to a version other than the current!"
  echo $versionInLinks
  exit 1
fi
