mkdir -p .temp/changelog/

# Clean-up background processes on exit.
trap 'exit' INT TERM ERR
trap 'kill 0' EXIT

# Convert changelog file to HTML.
(ls CHANGELOG.md | entr -s 'pandoc -f markdown -t html -s CHANGELOG.md > .temp/changelog/index.html') &

# Serve the HTML to view in a browser, with live reloading.
live-server --port=3000 .temp/changelog/
