init: ## Load a shell with all dependencies.
	@echo "You may type 'exit' to return to the regular shell.\n"
	nix develop -c "$$SHELL"

docs: ## Preview the documentation.
	elm-doc-preview

lint: ## Check for formatting errors.
	elm-format src --validate

test: ## Run tests.
	elm-test

validate: lint test validate-build validate-docs ## Run all validations.

validate-build: ## Check for build errors.
	elm make

validate-docs: ## Check for documentation errors.
	elm-doc-preview --output /dev/null



# The following makes this file self-documenting.
# See: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
