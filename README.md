# python-makefile

A Makefile to be used for automating Python development operations.

<!--TOC-->

- [python-makefile](#python-makefile)
  - [Description](#description)
  - [Why not uv, Poetry, Pipenv, etc...](#why-not-uv-poetry-pipenv-etc)
  - [Features](#features)
  - [Built-in commands](#built-in-commands)
  - [Workflow](#workflow)
  - [Security](#security)
  - [Extra Makefile targets](#extra-makefile-targets)
  - [Reproducible builds](#reproducible-builds)
  - [Authenticity](#authenticity)
  - [License](#license)
  - [Support this project](#support-this-project)

<!--TOC-->

## Description

Makefiles are not only useful for C or C++. You can use them for pretty much
everything. In this case, instead of writing complex commands by hand or using
a shell script, I use a Makefile to run complex operations in my Python
projects.

## Why not uv, Poetry, Pipenv, etc...

Those are non standard built-in tools:

- uv is now owned by OpenAI so it's dangerous in terms of vendor lock-in and
  rug-pulls
- Pipenv had [huge problems during the lock file phase](https://github.com/pypa/pipenv/issues?q=is%3Aissue%20lock%20failed); that was the first reason I stopped using it
- Poetry is complex, as stated in
  [their readme](https://github.com/python-poetry/poetry#contribute)
  > Poetry is a large, complex project always in need of contributors

Once
[pylock.toml](https://packaging.python.org/en/latest/specifications/pylock-toml/)
goes mainstream, this Makefile will be even simpler, possibily only requiring
built-in Python tools except from
[pip-audit](https://pypi.org/project/pip-audit/).

> [!NOTE]
> [hatch uses uv](https://github.com/pypa/hatch/blob/hatchling-v1.30.1/pyproject.toml#L58)
> so [build](https://pypi.org/project/build/) or
> [hatchling](https://pypi.org/project/hatchling/) are the preferred build
> backend tools instead.
> See also
> [How to create a pylock.toml lockfile](https://pydevtools.com/handbook/how-to/how-to-create-a-pylock-toml-lockfile/).

## Features

- setup and remove a development environment using venv
- lock requirements with hashes
- run tests, benchmarks, fuzzer and demo
- upload to PyPI
- build documentation
- setup, update and run pre-commit hooks
- cleanup

## Built-in commands

| Command | Description | Can override | Makefile override variable |
|---------|-------------|--------------|----------------------------|
| `make benchmark` | Run some benchmarks. Must be `${PYTHON_MODULE_NAME}/tests/benchmark.py` | ✘ |
| `make clean` | Clean temporary files | ✓ | `OVERRIDE_CLEAN` |
| `make doc` | Build the documentation with sphinx | ✓ | `OVERRIDE_DOC` |
| `make demo` | Run a CLI demo to show how the project works. Uses asciinema | ✘ | |
| `make dist` | Create reproducible wheel and source distributions ready for PyPI, as well as their checksums | ✘ | |
| `make fuzzer` | Run a fuzzer. Must be `${PYTHON_MODULE_NAME}/tests/fuzzer.py` | ✘ | |
| `make install-dev` | Install the development environment | ✓ | `OVERRIDE_INSTALL_DEV` |
| `make pre-commit` | Run all pre-commit hooks | ✘ | |
| `make pre-commit-update` | Update pre-commit hooks | ✓ | `OVERRIDE_UPDATE` |
| `make regenerate-lock` | Pin and checksum Python production requirements in a file | ✓ | `OVERRIDE_REGENERATE_LOCK` |
| `make regenerate-dev-lock` | Pin and checksum Python development requirements in a file | ✓ | `OVERRIDE_REGENERATE_DEV_LOCK` |
| `make test` | Run unit tests for all Python versions defined in `./setup.cfg`. Must be in `${PYTHON_MODULE_NAME}/tests/tests.py` | ✘ | |
| `make test-single` | Run unit tests for the default Python version. Must be in `${PYTHON_MODULE_NAME}/tests/tests.py` | ✘ | |
| `make upload` | Upload the distribution files generated with `make dist` to PyPI | ✘ | |
| `make uninstall-dev` | Remove the development environment | ✓ | `OVERRIDE_UNINSTALL_DEV` |

## Workflow

1. install [curl](https://curl.se/). On Debian-based systems:

   ```shell
   apt install curl
   ```

2. create a [`.project.mk`](./.project.linux.mk.example) file in your repository

   ```shell
   curl -o .project.mk https://codeberg.org/frnmst/python-makefile/raw/branch/master/.project.linux.mk.example
   ```

   In this example we are setting up the
   [md-toc](https://codeberg.org/frnmst/md-toc) project.

   The name of the project is `md-toc` (with hyphen) but the Python module is
   called `md_toc` (underscore). That is why there are two variables.

3. add `Makefile` to your gitignore

   ```shell
   echo 'Makefile' >> .gitignore
   ```

4. download the Makefile in your project. The follwing pulls new updates from
   this repository if there have been changes in the Makefile:

   ```shell
   make -f .project.mk bootstrap
   ```

5. If you are bootstrapping a new project from scratch, regenerate the
   requirements lock files:

   ```shell
   make regenerate-dev-lock
   make regenerate-lock
   ```

6. install the development environment from the lock file. Your project must
   have a `pyproject.toml` file:

   ```shell
   make install-dev
   ```

## Security

To mitigate supply chain attacks, as suggested by
[this PyPI blog post](https://blog.pypi.org/posts/2026-04-02-incident-report-litellm-telnyx-supply-chain-attack/), dependency cooldown was added in python-makefile 0.3.0 via the
`--uploaded-prior-to` pip option.

## Extra Makefile targets

You can also create new targets in [`.project.mk`](./.project.mk.example) and
run them

```shell
make example-target
```

Overriding is simple: just add your overridden target and the override variable
in the [`.project.mk`](./.project.linux.mk.example) file.

## Reproducible builds

To deterministically build your Python project inside a Docker container, run:

```shell
sudo make dist
```

This also generates checksums for the wheel and source distributions.

## Authenticity

Python projects contain a `./safe_install.sh` script that checks the signed
shell commands against my public GPG key and compares local hashes with the
ones available on PyPI. Follow the instructions on respective project readmes.

## License

MIT License

Copyright (C) 2024-2026 Franco Masotti (see /README.md)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Support this project

- [GitHub Sponsors](https://github.com/sponsors/frnmst)
- [Buy Me a Coffee](https://www.buymeacoffee.com/frnmst)
- [Liberapay](https://liberapay.com/frnmst)
