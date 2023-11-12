init: ## Load a shell with all dependencies (if you don't use direnv).
	@echo "You may type 'exit' to return to the regular shell.\n"
	nix develop -c "$$SHELL"

docs: ## Preview the documentation.
	elm-doc-preview --port 8001 --no-browser

interactive-docs: interactive-docs-install ## Preview the interactive documentation.
	cd docs && pnpx parcel src/index.html
interactive-docs-install:
	cd docs && pnpm install

changelog: ## Preview the changelog.
	$$SHELL scripts/changelog.sh

lint: ## Check for formatting errors.
	elm-format src --validate
	elm-review src

lint-fix: ## Automatically fix linting errors.
	elm-format src --yes
	elm-review src --fix

test: ## Run tests.
	@echo No tests yet.
# elm-test

validate: validate-build test validate-docs lint ## Run all validations.

validate-build: ## Make sure it builds.
	elm make

validate-docs: ## Make sure the docs can be generated.
	elm-doc-preview --output /dev/null



# The following makes this file self-documenting.
# See: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
