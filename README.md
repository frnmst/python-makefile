# python-makefile

A Makefile to be used for automating Python development operations

## Description

TODO

## Features

- setup development environment using venv
- freeze requirements with hashes
- install and uninstall locally
- run tests, benchmarks, fuzzer and demo
- upload to PyPI
- build Sphinx documentation
- run pre-commit
- cleanup

## Example

Create a `.project.mk` file in your repository. In this example we are setting
up the [md-toc](https://software.franco.net.eu.org/frnmst/md-toc) project. The
name of the project is `md-toc` (with hyphen) but the Python module is called
`md_toc` (underscore). That's why there are two variables.

```makefile
PROJECT_NAME := md-toc
PYTHON_MODULE_NAME := md_toc

MAKEFILE_SOURCE := https://software.franco.net.eu.org/frnmst/python-makefile/raw/branch/master/Makefile
bootstrap:
	curl -o Makefile $(MAKEFILE_SOURCE)

# Add extra targets here.
example-target:
	@echo "This is an example target"
```

Download the makefile

```
make -f .project.mk bootstrap
```

Now you can run your operations, for example

```shell
make install-dev
make test
```

You can also create new targets locally and run them

```shell
make example-target
```
