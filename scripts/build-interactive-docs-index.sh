#!/usr/bin/env bash

source ./scripts/functions.sh

outputDir=./interactive-docs/output

echo "Generating interactive docs version index."

mkdir -p "$outputDir"

versions=$(
  find "$outputDir" -maxdepth 1 -mindepth 1 -type d \
  | awk -F '/' '{print $NF}' \
  | sort --reverse
)
versionLinks=$(
  echo "$versions" \
  | awk '
      NR == 1 { print "<li><a href=\"" $0 "\">" $0 " (latest)</a></li>" }
      NR != 1 { print "<li><a href=\"" $0 "\">" $0 "</a></li>" }
    ' \
  | tr -d '\n'
)

sed -E "s|#versionLinks#|$versionLinks|" \
  < ./interactive-docs/src/versions-index.html \
  > "$outputDir/index.html"
