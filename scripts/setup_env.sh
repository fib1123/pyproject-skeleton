#!/bin/bash

if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found. Please create one."
    exit 1
fi

source .env

# create env
mamba env create -f environment.yml

# setup project
mamba activate $PROJECT_NAME
python -m ipykernel install --user --name $PROJECT_NAME --display-name "${PROJECT_NAME}"

poetry install  # install the packages defined in pyproject.toml.
