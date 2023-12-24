init: ## Load a shell with all dependencies (if you don't use direnv).
	@echo "You may type 'exit' to return to the regular shell.\n"
	nix develop -c "$$SHELL"

docs: ## Preview the documentation.
	elm-doc-preview --port 8001 --no-browser

validate: check-build test check-docs lint check-examples ## Run all tests, checks and lint.

test: ## Run tests.
	elm-test

test-watch: ## Run tests and watch for changes.
	elm-test --watch

lint: ## Check for formatting errors.
	elm-format src --validate
	elm-review src

lint-fix: ## Automatically fix linting errors.
	elm-format src --yes
	elm-review src --fix

check-build: ## Make sure it builds.
	elm make

check-examples: ## Make sure the examples build.
	$$SHELL scripts/check-examples.sh

check-docs: ## Make sure the docs can be generated.
	elm-doc-preview --output /dev/null



# The following makes this file self-documenting.
# See: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
