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

1. Create the environment and install the dependencies: 
```
make install # setups mamba env
mamba activate myproject # poetry and everything else needs to be setup within mamba
poetry install # install the packages defined in pyproject.toml.
```
2. **Activate the Mamba environment**: Activate the environment with `mamba activate myproject`

3. When you want to add or update dependencies, update the environment:
* if conda dependency then update environment.yml and run `make update-env`
* if pip based dependency then update pyproject.toml and run `poetry install` or `poetry add <package>`

4. **Run tests**: `make test`

5. To bump the version, run: `make bump-version part=<part>`

Replace `<part>` with `major`, `minor`, or `patch` depending on which part of the version you want to increment.

6. Commit your changes, push them to GitLab, and create a merge request.

7. GitLab CI/CD will automatically run tests, build, and publish the package to your GitLab package registry whenever a new tag is created.

This setup provides a streamlined development flow by combining the strengths of Mamba and Poetry for environment and dependency management. Mamba efficiently handles non-Python dependencies and environment creation, while Poetry offers an intuitive way to manage Python dependencies and package building, the Makefile simplifies common tasks

## Directory Structure

- `myproject/`: The top-level directory that contains your Python package.
- `tests/`: The directory that contains your test files.
- `environment.yml`: The file that specifies your Python, CUDA, and CUDNN versions, as well as Mamba dependencies.
- `pyproject.toml`: The file that specifies your package's metadata and dependencies using the modern approach.
- `requirements/`: The directory that contains `prod.in` and `dev.in` files for specifying production and development dependencies.
- `.gitlab-ci.yml`: The file that configures the GitLab CI/CD pipeline for building and publishing your package.
- `Makefile`: The file that contains shortcuts for running common commands.
- `README.md`: The file that contains a description of your project and usage instructions.
- `.gitignore`: The file that lists files and directories to ignore in your Git repository.

