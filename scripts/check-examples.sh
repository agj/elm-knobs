#!/usr/bin/env bash

result=$(find ./examples/ -maxdepth 1 -mindepth 1 -type d -not -path '*/\.*' -not -path '*elm-stuff*')

echo "$result" | while read -r dir
do
  echo "Checking example in $dir …"
  cd "$dir" || exit 1
  elm make ./*.elm --output /dev/null || exit 1
  cd - || exit 1
  printf "\n"
done
