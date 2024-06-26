init: ## Load a shell with all dependencies (if you don't use direnv).
	@echo "You may type 'exit' to return to the regular shell.\n"
	nix develop -c "$$SHELL"

docs: ## Preview the documentation.
	elm-doc-preview --port 8001 --no-browser

interactive-docs: interactive-docs-install ## Preview and develop the interactive documentation.
	cd interactive-docs && pnpm exec parcel

interactive-docs-full: interactive-docs-build ## Preview the interactive docs in full.
	pnpm install
	pnpm exec http-server ./interactive-docs/output/

interactive-docs-build: interactive-docs-install ## Build the interactive documentation.
	rm -rf ./interactive-docs/.parcel-cache # Sad workaround.
	cd interactive-docs && pnpm exec parcel build --dist-dir "./output/$(shell nu ./scripts/get-current-version.nu)"
	nu ./scripts/build-examples.nu
	nu ./scripts/build-interactive-docs-index.nu

interactive-docs-deploy: interactive-docs-build ## Deploy interactive documentation to GH pages.
	pnpm install
	pnpm exec gh-pages --remote github --dist ./interactive-docs/output

interactive-docs-install:
	cd interactive-docs && pnpm install

validate: check-build test check-docs lint check-examples check-version ## Run all tests, checks and lint.

test: ## Run tests.
	elm-test

test-watch: ## Run tests and watch for changes.
	elm-test --watch

lint: ## Check for formatting errors.
	elm-format src --validate
	elm-review

lint-fix: ## Automatically fix linting errors.
	elm-format src --yes
	elm-review --fix

lint-suppress: ## Suppress al remaining errors.
	elm-review suppress

check-build: ## Make sure it compiles.
	elm make --output /dev/null

check-examples: ## Make sure the examples compile.
	nu ./scripts/check-examples.nu

check-docs: ## Make sure the docs can be generated.
	elm-doc-preview --output /dev/null

check-version: ## Make sure the package version is consistent across.
	nu ./scripts/check-version.nu



# The following makes this file self-documenting.
# See: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
