
docs: ## Preview the documentation.
	pnpm exec elm-doc-preview

lint: ## Check for formatting errors.
	pnpm exec elm-format src --validate

test: ## Run tests.
	pnpm exec elm-test

validate: lint test validate-build validate-docs ## Run all validations.

validate-build: ## Check for build errors.
	pnpm exec elm make

validate-docs: ## Check for documentation errors.
	pnpm exec elm-doc-preview --output /dev/null



# The following makes this file self-documenting.
# See: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
