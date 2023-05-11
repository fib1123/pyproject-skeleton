.PHONY: install update-env test bump-version

install:
	mamba env create -f environment.yml --name my_project || mamba env update -f environment.yml --name my_project

update-env:
	mamba env update -f environment.yml

test:
	pytest tests/

bump-version:
	poetry run bump2version $(part)
