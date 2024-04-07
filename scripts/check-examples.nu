use std log

print "ℹ️ Checking examples…"

glob ./examples/* --no-file --exclude [elm-stuff, .* ]
  | each { |dir|
    let folderName = $dir | split row '/' | last
    print $"🔍 Checking '($folderName)' example"
    cd $dir
    let elmMakeResult = do { ^elm make ./*.elm --output /dev/null }
      | complete
    if ($elmMakeResult | get exit_code) != 0 {
      print ($elmMakeResult | get stderr)
      exit 1
    }
  }

print "✅ Done checking examples"
