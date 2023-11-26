#!/usr/bin/env bash

source './scripts/functions.sh'

outputDir=./docs/output

echo "Generating interactive docs version index."

mkdir -p "$outputDir"

versions=$(find "$outputDir" -maxdepth 1 -mindepth 1 -type d  | awk -F '/' '{print $NF}')
versionLinks=$(echo "$versions" | sed -E 's|(.*)|<li><a href="\1">\1</a></li>|g')

sed -E "s|#versionLinks#|$versionLinks|" < ./docs/src/versions-index.html > "$outputDir/index.html"
