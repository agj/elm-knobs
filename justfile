[private]
default:
    just --list

# Load a shell with all dependencies (if you don't use direnv).
init:
    @echo "You may type 'exit' to return to the regular shell.\n"
    nix develop -c "$SHELL"

# Preview the documentation.
docs:
    elm-doc-preview --port 8001 --no-browser

# Preview and develop the interactive documentation.
intdocs: intdocs-install
    cd interactive-docs && pnpm exec parcel

# Preview the interactive docs in full.
intdocs-full: install intdocs-build
    pnpm exec http-server ./interactive-docs/output/

# Update interactive doc example code.
intdocs-update-examples:
    nu ./scripts/update-example-code-strings.nu

# Build the interactive documentation.
intdocs-build: install intdocs-install intdocs-update-examples
    rm -rf ./interactive-docs/.parcel-cache # Sad workaround.
    cd interactive-docs && pnpm exec parcel build --dist-dir "./output/$(shell nu ./scripts/get-current-version.nu)"
    nu ./scripts/build-examples.nu
    nu ./scripts/build-interactive-docs-index.nu

# Deploy interactive documentation to GH pages.
intdocs-deploy: intdocs-build
    pnpm install
    pnpm exec gh-pages --remote github --dist ./interactive-docs/output

[private]
intdocs-install:
    cd interactive-docs && pnpm install

[private]
install:
    pnpm install

# Updates the example code in the readme.
readme-update-example:
    nu ./scripts/update-readme-example.nu

# Run tests.
test:
    elm-test

# Run tests and watch for changes.
test-watch:
    elm-test --watch

# Run all checks and tests.
check: check-build test check-docs check-lint check-examples check-version

# Check for formatting errors.
check-lint:
    elm-format src --validate
    elm-review

# Automatically fix formatting errors.
check-lint-fix:
    elm-format src --yes
    elm-review --fix

# Suppress all remaining errors.
check-lint-suppress:
    elm-review suppress

# Check suppressed formatting errors.
check-lint-unsuppress:
    elm-review --unsuppress

# Make sure it compiles.
check-build:
    elm make --output /dev/null

# Make sure the examples compile.
check-examples:
    nu ./scripts/check-examples.nu

# Make sure the docs can be generated.
check-docs:
    elm-doc-preview --output /dev/null

# Make sure the package version is consistent across.
check-version:
    nu ./scripts/check-version.nu
