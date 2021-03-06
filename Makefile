# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# checks and linting

.PHONY: check-package
check-package:
	poetry check -v

.PHONY: check-format
check-format:
	poetry run black --check .
	poetry run isort -c .

.PHONY: lint
lint:
	poetry run flake8 .

.PHONY: test
test:
	poetry run coverage run -m pytest --verbose -Werror
	poetry run coverage report

.PHONY: check
check: check-format check-package lint

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# formatting

.PHONY: format
format:
	poetry run black .
	poetry run isort .

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# packaging

.PHONY: build
build:
	poetry build
