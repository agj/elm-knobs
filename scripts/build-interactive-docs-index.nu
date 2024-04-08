let outputDir = "./interactive-docs/output"

print "ℹ️ Generating interactive docs version index."

^mkdir -p $outputDir

let versions = glob --no-file $"($outputDir)/*"
  | each { parse --regex '/([0-9.]+)$' }
  | filter { length | $in > 0 }
  | each { get 0 | get capture0 }
  | sort --reverse

let versionLinks = $versions
  | enumerate
  | each { |row|
    let version = $row | get item
    if ($row | get index) == 0 {
      '<li><a href="' ++ $version ++ '">' ++ $version ++ ' (latest)</a></li>'
    } else {
      '<li><a href="' ++ $version ++ '">' ++ $version ++ '</a></li>'
    }
  }

open ./interactive-docs/src/versions-index.html
  | str replace '#versionLinks#' ($versionLinks | str join '')
  | save --force $"($outputDir)/index.html"
