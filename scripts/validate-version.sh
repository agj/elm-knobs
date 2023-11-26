#!/usr/bin/env bash

source './scripts/functions.sh'

currentVersion=$(getCurrentVersion)

echo "Validating package version consistency."
echo "Current version: $currentVersion"
echo

# Changelog

changelogHasCurrentVersion=$(getAllVersionsInChangelog | grep -F "$currentVersion")

if [ -z "$changelogHasCurrentVersion" ]
then
  echo "Error: Changelog doesn't have an entry for the current version!"
  exit 1
fi

# Git tags

allVersionsInGit=$(getAllVersionsInGit)
gitHasCurrentVersion=$(echo "$allVersionsInGit" | grep -F "$currentVersion")

if [ -z "$gitHasCurrentVersion" ]
then
  echo "Error: There is no git tag for the current version!"
  exit 1
fi

# Links in code

versionsUsedInCode=$(getVersionsUsedInLinks src/Knob.elm) 
outdatedVersionsInCode=$(echo "$versionsUsedInCode" | grep -vF "$currentVersion")

if [ "$outdatedVersionsInCode" ]
then
  echo "Error: There's links in the code that point to an outdated version!"
  echo "$outdatedVersionsInCode"
  exit 1
fi

# Links in readme

versionsUsedInReadme=$(getVersionsUsedInLinks ./README.md) 
outdatedVersionsInReadme=$(echo "$versionsUsedInReadme" | grep -vF "$currentVersion")

if [ "$outdatedVersionsInReadme" ]
then
  echo "Error: There's links in the readme that point to an outdated version!"
  echo "$outdatedVersionsInReadme"
  exit 1
fi

# Interactive docs

versionInInteractiveDocs=$(
  awk -F '"' '/"[[:digit:].]+"/ {print $2}' ./docs/src/Constants.elm | head --lines=1
)
outdatedVersionInInteractiveDocs=$(echo "$versionInInteractiveDocs" | grep -vF "$currentVersion")

if [ "$outdatedVersionInInteractiveDocs" ]
then
  echo "Error: The version in the interactive docs is outdated!"
  echo "$outdatedVersionInInteractiveDocs"
  exit 1
fi

if [ ! -f "./docs/output/$currentVersion/index.html" ]
then
  echo "Error: There is no interactive documentation for the current version!"
  exit 1
fi
