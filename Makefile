.PHONY: install_conda update_conda test bump-version

install_conda:
	mamba env create -f environment.yml

update_conda:
	mamba env update -f environment.yml

test:
	pytest tests/
