default:
    just --list

# Load a shell with all dependencies (if you don't use direnv).
init:
    @echo "You may type 'exit' to return to the regular shell.\n"
    nix develop -c "$$SHELL"

# Preview the documentation.
docs:
    elm-doc-preview --port 8001 --no-browser

# Preview and develop the interactive documentation.
interactive-docs: interactive-docs-install
    cd interactive-docs && pnpm exec parcel

# Preview the interactive docs in full.
interactive-docs-full: interactive-docs-build
    pnpm install
    pnpm exec http-server ./interactive-docs/output/

# Update interactive doc example code.
interactive-docs-update-examples:
    nu ./scripts/update-example-code-strings.nu

# Build the interactive documentation.
interactive-docs-build: interactive-docs-install
    rm -rf ./interactive-docs/.parcel-cache # Sad workaround.
    cd interactive-docs && pnpm exec parcel build --dist-dir "./output/$(shell nu ./scripts/get-current-version.nu)"
    nu ./scripts/build-examples.nu
    nu ./scripts/build-interactive-docs-index.nu

# Deploy interactive documentation to GH pages.
interactive-docs-deploy: interactive-docs-build
    pnpm install
    pnpm exec gh-pages --remote github --dist ./interactive-docs/output

interactive-docs-install:
    cd interactive-docs && pnpm install

# Run all tests, checks and lint.
validate: check-build test check-docs lint check-examples check-version

# Run tests.
test:
    elm-test

# Run tests and watch for changes.
test-watch:
    elm-test --watch

# Check for formatting errors.
lint:
    elm-format src --validate
    elm-review

# Automatically fix linting errors.
lint-fix:
    elm-format src --yes
    elm-review --fix

# Suppress al remaining errors.
lint-suppress:
    elm-review suppress

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
