# My Data Science Project

This is a reusable skeleton for Data Science projects in Python.


## Motivation

In this project, we use Mamba and Poetry to manage dependencies, environments, and packaging.

- **Mamba**: A fast and efficient alternative to Conda that leverages the Conda package format. Mamba is used to create the environment and manage Conda-based dependencies, such as specific versions of Python, CUDA, or other non-Python packages. By using Mamba, we can ensure that our project works with the desired versions of these non-Python packages and benefit from its improved performance.

- **Poetry**: A modern dependency and package management tool for Python projects. Poetry provides a simpler and more intuitive way to manage project dependencies, environments, and package building. It also has built-in support for virtual environments and editable installations, making it easy to develop and test packages locally. By using Poetry, we can streamline our Python dependency management and package publishing process.

## Setup

### Install Mamba

Install Mamba by following the instructions in the [official documentation](https://github.com/mamba-org/mamba#install-mambaforge).

### Install Poetry

Install Poetry by following the instructions in the [official documentation](https://python-poetry.org/docs/#installation).


## Development Flow



1. Create a `.env` file in your project's root directory using the provided template: `.env_template`. Fill in desired env variables (please note that project name is taken from .environment.yml file)

2. Run the setup script ` source scripts/setup_env.sh` (use source to execute in current terminal context!)

This script will do the following:

- Read the configuration from the `.env` file.
- Create a Mamba environment using the `environment.yml` file.
- Set up the project by activating the Mamba environment and installing the required packages using Poetry.

3. **Activate the Mamba environment**: Activate the environment with `mamba activate $PROJECT_NAME`

4. When you want to add or update dependencies, update the environment:
* if conda dependency then update environment.yml and run `make update_conda`
* if pip based dependency then update pyproject.toml and run `poetry install` or `poetry add <package>` (be sure to do it within conda env). If the dependency is just for development add flag -D

5. **Run tests**: `make test`

6. To bump the version, run: `bump2version $(part)`

Replace `<part>` with `major`, `minor`, or `patch` depending on which part of the version you want to increment.

7. Commit your changes, push them to GitLab, and create a merge request.

8. GitLab CI/CD will automatically run tests, build, and publish the package to your GitLab package registry whenever a new tag is created.

This setup provides a streamlined development flow by combining the strengths of Mamba and Poetry for environment and dependency management. Mamba efficiently handles non-Python dependencies and environment creation, while Poetry offers an intuitive way to manage Python dependencies and package building, the Makefile simplifies common tasks

## Configuration using .env file and python-dotenv
This project allows you to store environment-specific configurations in a .env file, which makes it easy to manage settings across different environments. The .env file should be located in the root directory of the project. We will use the python-dotenv package to load the environment variables from the .env file.

Setting up the .env file
Create a new file named .env in the project's root directory.

Add your environment-specific settings, one per line, using the following format:

```
VARIABLE_NAME=value
```

### Loading env to console:
```
source .env
```
### Using the .env file in your Python code
To use the environment variables defined in the .env file, you need to load them using the python-dotenv package. Add the following lines at the beginning of your Python script or application entry point:

```
from dotenv import load_dotenv
load_dotenv()
```
The environment variables will now be available in your Python code using os.environ:

```
import os
my_environment_name = os.environ.get('VARIABLE_NAME')
```

## Directory Structure

- `myproject/`: The top-level directory that contains your Python package.
- `notebooks/`: Directory for your jupyter notebooks
- `tests/`: The directory that contains your test files.
- `environment.yml`: The file that specifies your Python, CUDA, and CUDNN versions, as well as Mamba dependencies.
- `pyproject.toml`: The file that specifies your package's metadata and dependencies using the modern approach.
- `requirements/`: The directory that contains `prod.in` and `dev.in` files for specifying production and development dependencies.
- `.gitlab-ci.yml`: The file that configures the GitLab CI/CD pipeline for building and publishing your package.
- `Makefile`: The file that contains shortcuts for running common commands.
- `README.md`: The file that contains a description of your project and usage instructions.
- `.gitignore`: The file that lists files and directories to ignore in your Git repository.
- `scripts/`: The directory that contains your setup script (`setup_env.sh`).



___
## Sources
* https://stackoverflow.com/questions/70851048/does-it-make-sense-to-use-conda-poetry
* https://github.com/the-full-stack/conda-piptools
