use functions.nu [getExamples, getCurrentVersion]

let version = getCurrentVersion

def minifyHtml [file] {
  (^html-minifier --collapse-whitespace --remove-comments --remove-tag-whitespace --minify-css=true --minify-js=true $file)
}

getExamples
  | each { |example|
    print $"ℹ️ Building example: ($example.name)"
    cd $example.dir

    let outputDir = $"../../interactive-docs/output/($version)/examples/($example.name)"
    let outputHtmlFile = $"($outputDir)/index.html"
    let outputJsFile = $"($outputDir)/main.js"

    if ("index.html" | path exists) {
      (^elm make ./*.elm --output $outputJsFile --optimize)

      (^uglifyjs --compress --mangle -- $outputJsFile)
        | save --force $outputJsFile

      minifyHtml "./index.html"
        | save --force $outputHtmlFile
    } else {
      (^elm make ./*.elm --output $outputHtmlFile --optimize)

      minifyHtml $outputHtmlFile
        | save --force $outputHtmlFile
    }
  }
