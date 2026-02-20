[private]
@default:
    just --list --unsorted

# Load a shell with all dependencies (if you don't use direnv).
init:
    @echo "You may type 'exit' to return to the regular shell.\n"
    nix develop -c "$SHELL"

# Preview the documentation.
[group("docs")]
docs:
    elm-doc-preview --port 8001 --no-browser

# Preview and develop the interactive documentation.
[group("docs")]
intdocs: intdocs-install
    cd interactive-docs && pnpm exec vite --clearScreen false

# Preview the interactive docs in full.
[group("docs")]
intdocs-full: install intdocs-build
    pnpm exec http-server ./interactive-docs/output/

# Update interactive doc example code.
[group("docs")]
intdocs-update-examples:
    nu ./scripts/update-example-code-strings.nu

# Build the interactive documentation.
[group("docs")]
intdocs-build: install intdocs-install intdocs-update-examples
    cd interactive-docs && pnpm exec vite build --outDir "./output/{{shell("nu ./scripts/get-current-version.nu")}}"
    nu ./scripts/build-examples.nu
    nu ./scripts/build-interactive-docs-index.nu

# Deploy interactive documentation to GH pages.
[group("docs")]
intdocs-deploy: intdocs-build
    pnpm install
    pnpm exec gh-pages --remote github --dist ./interactive-docs/output

# Updates the example code in the readme.
[group("docs")]
readme-update-example:
    nu ./scripts/update-readme-example.nu

[private]
intdocs-install:
    cd interactive-docs && pnpm install

[private]
install:
    pnpm install

# Run tests.
[group("checks")]
test:
    elm-test

# Run tests and watch for changes.
[group("checks")]
test-watch:
    elm-test --watch

# Run all checks and tests.
[group("checks")]
check: check-build test check-docs check-lint check-examples check-version

# Check for formatting errors.
[group("checks")]
check-lint:
    elm-format src --validate
    elm-review

# Automatically fix formatting errors.
[group("checks")]
check-lint-fix:
    elm-format src --yes
    elm-review --fix

# Suppress all remaining errors.
[group("checks")]
check-lint-suppress:
    elm-review suppress

# Check suppressed formatting errors.
[group("checks")]
check-lint-unsuppress:
    elm-review --unsuppress

# Make sure it compiles.
[group("checks")]
check-build:
    elm make --output /dev/null

# Make sure the examples compile.
[group("checks")]
check-examples:
    nu ./scripts/check-examples.nu

# Make sure the docs can be generated.
[group("checks")]
check-docs:
    elm-doc-preview --output /dev/null

# Make sure the package version is consistent across.
[group("checks")]
check-version:
    nu ./scripts/check-version.nu
