mkdir -p .temp/changelog/

# Clean-up background processes on exit.
trap 'exit' INT TERM ERR
trap 'kill 0' EXIT

# Convert changelog markdown to HTML.
(ls CHANGELOG.md | entr -s 'pandoc -f markdown -t html CHANGELOG.md > .temp/changelog/index.html ; echo Updated.') &

# Serve the HTML to view in a browser.
serve .temp/changelog/ -l 3000
