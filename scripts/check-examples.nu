use functions.nu getExamples

print "ℹ️ Checking examples…"

getExamples
  | each { |example|
    print $"🔍 Checking '($example.name)' example"
    cd $example.dir
    let elmMakeResult = do { ^elm make ./*.elm --output /dev/null }
      | complete
    if ($elmMakeResult | get exit_code) != 0 {
      print ($elmMakeResult | get stderr)
      exit 1
    }
  }

print "✅ Done checking examples"
