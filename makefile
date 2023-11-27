init: ## Load a shell with all dependencies (if you don't use direnv).
	@echo "You may type 'exit' to return to the regular shell.\n"
	nix develop -c "$$SHELL"

.PHONY: docs
docs: ## Preview the documentation.
	elm-doc-preview --port 8001 --no-browser

interactive-docs: interactive-docs-install ## Preview the interactive documentation.
	cd docs && pnpx parcel
interactive-docs-install:
	cd docs && pnpm install

interactive-docs-build: interactive-docs-install ## Build the interactive documentation.
	cd docs && pnpx parcel build --dist-dir "./output/$(shell bash ./scripts/get-current-version.sh)"
	bash ./scripts/build-interactive-docs-index.sh

interactive-docs-deploy: interactive-docs-build install ## Deploy interactive documentation to GH pages.
	pnpx gh-pages --remote github --dist ./docs/output
install:
	pnpm install

lint: ## Check for formatting errors.
	elm-format src --validate
	elm-review src

lint-fix: ## Automatically fix linting errors.
	elm-format src --yes
	elm-review src --fix

test: ## Run tests.
	@echo No tests yet.
# elm-test

validate: validate-build test validate-docs validate-examples lint validate-version ## Run all validations.

validate-build: ## Make sure it compiles.
	elm make --output=/dev/null

validate-docs: ## Make sure the docs can be generated.
	elm-doc-preview --output /dev/null

validate-examples: ## Make sure the examples compile.
	cd examples && elm make ./src/*Example.elm --output=/dev/null

validate-version: ## Make sure the package version is consistent across.
	bash ./scripts/validate-version.sh



# The following makes this file self-documenting.
# See: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
