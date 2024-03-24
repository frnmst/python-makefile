# python-makefile

A Makefile to be used for automating Python development operations

## Description

Makefiles are not only useful for C or C++. You can use them for pretty much
everything. In this case, instead of writing complex commands by hand or using
a shell script, I use a Makefile to run operations I use frequently in my
Python projects.

## Features

- setup development environment using venv
- freeze requirements with hashes
- install and uninstall locally
- run tests, benchmarks, fuzzer and demo
- upload to PyPI
- build Sphinx documentation
- run pre-commit
- cleanup

## Built-in commands

| Command | Description | Can override | Makefile override variable |
|---------|-------------|--------------|----------------------------|
| `make benchmark` | Run some benchmarks. Must be `${PYTHON_MODULE_NAME}/tests/benchmark.py` | ✘ |
| `make check-requirements` | Compare `requirements-freeze.txt` checksums to PyPI packages | ✘ | |
| `make clean` | Clean temporary files | ✓ | `OVERRIDE_CLEAN` |
| `make doc` | Build the documentation with sphinx | ✘ | |
| `make demo` | Run a CLI demo to show how the project works. Uses asciinema | ✘ | |
| `make dist` | Create wheel and source distributions ready for PyPI | ✘ | |
| `make datadog` | Check all Python dependencies for suspicious data. Requires Docker. | ✘ | |
| `make fuzzer` | Run a fuzzer. Must be `${PYTHON_MODULE_NAME}/tests/fuzzer.py` | ✘ | |
| `make install` | Install the package in the user home | ✘ | |
| `make install-dev` | Install the development environment | ✘ | |
| `make pre-commit` | Run all pre-commit hooks | ✘ | |
| `make regenerate-freeze` | Same as `make regenerate-freeze-no-hashes` and adds checksum to the pinned requirements files | ✘ | |
| `make regenerate-freeze-no-hashes` | Just do a `pip freeze` on the development environment | ✘ | |
| `make test` | Run unit tests for all Python versions defined in `./setup.cfg`. Must be in `${PYTHON_MODULE_NAME}/tests/tests.py` | ✘ | |
| `make test-single` | Run unit tests for the default Python version. Must be in `${PYTHON_MODULE_NAME}/tests/tests.py` | ✘ | |
| `make update` | Update pre-commit hooks | ✓ | `OVERRIDE_UPDATE` |
| `make upload` | Upload the distribution files generated with `make dist` to PyPI | ✘ | |
| `make uninstall` | Remove the package from the user home | ✘ | |
| `make uninstall-dev` | Remove the development environment | ✘ | |

## Example

Create a [`.project.mk`](./.project.mk.example) file in your repository. In this
example we are setting up the
[md-toc](https://software.franco.net.eu.org/frnmst/md-toc) project.

The name of the project is `md-toc` (with hyphen) but the Python module is
called `md_toc` (underscore). That's why there are two variables.

First of all add `Makefile` to your gitignore

```shell
echo 'Makefile' >> .gitignore
```

Then download the Makefile in your project

```
make -f .project.mk bootstrap
```

Now you can run your operations, for example

```shell
make install-dev
make test
```

You can also create new targets in `.project.mk` and run them

```shell
make example-target
```

Overriding is simple. Just add your overriden target and the override variable
in the `.project.mk` file.
