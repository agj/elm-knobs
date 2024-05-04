use functions.nu getExamples

print "ℹ️ Checking examples…"

let interactiveDocsFullExamplesElm = open "./interactive-docs/src/ChaptersFull.elm"

getExamples
  | each { |example|
    print $"🔍 Checking '($example.name)' example."

    cd $example.dir
    let elmMakeResult = do { ^elm make ./*.elm --output /dev/null }
      | complete

    if ($elmMakeResult | get exit_code) != 0 {
      print "❌ Compilation error."
      print ($elmMakeResult | get stderr)
      exit 1
    }

    let isInInteractiveDocs = $interactiveDocsFullExamplesElm
      | find --regex $"slug = \"($example.name)\""

    if $isInInteractiveDocs == null {
      print "❌ Cound not find it in the interactive documentation."
      exit 1
    }
  }

print "✅ Done checking examples"
