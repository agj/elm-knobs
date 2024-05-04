use functions.nu [getExamples, getCurrentVersion, minifyHtml]

let version = getCurrentVersion

getExamples
  | each { |example|
    print $"ℹ️ Building example: ($example.name)"

    let inputHtmlFile = $"($example.dir)/index.html"
    let inputElmFile = $"($example.dir)/Main.elm"
    let outputDir = $"./interactive-docs/output/($version)/examples/($example.name)"
      | path expand
    let outputHtmlFile = $"($outputDir)/index.html"
    let outputJsFile = $"($outputDir)/main.js"

    if ($inputHtmlFile | path exists) {
      enter $example.dir
      (^elm make $inputElmFile --output $outputJsFile --optimize)
      dexit

      (^uglifyjs --compress --mangle -- $outputJsFile)
        | save --force $outputJsFile

      minifyHtml $inputHtmlFile
        | save --force $outputHtmlFile
    } else {
      enter $example.dir
      (^elm make $inputElmFile --output $outputHtmlFile --optimize)
      dexit

      minifyHtml $outputHtmlFile
        | save --force $outputHtmlFile
    }
  }
