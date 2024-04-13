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
| `make doc` | Build the documentation with sphinx | ✓ | `OVERRIDE_DOC` |
| `make demo` | Run a CLI demo to show how the project works. Uses asciinema | ✘ | |
| `make dist` | Create wheel and source distributions ready for PyPI | ✘ | |
| `make datadog` | Check all Python dependencies for suspicious data. Requires Docker. | ✘ | |
| `make fuzzer` | Run a fuzzer. Must be `${PYTHON_MODULE_NAME}/tests/fuzzer.py` | ✘ | |
| `make install` | Install the package in the user home | ✓ | `OVERRIDE_INSTALL` |
| `make install-dev` | Install the development environment | ✓ | `OVERRIDE_INSTALL_DEV` |
| `make pre-commit` | Run all pre-commit hooks | ✘ | |
| `make regenerate-freeze` | Same as `make regenerate-freeze-no-hashes` and adds checksum to the pinned requirements files | ✓ | `OVERRIDE_REGENERATE_FREEZE` |
| `make regenerate-freeze-no-hashes` | Just do a `pip freeze` on the development environment | ✓ | `OVERRIDE_REGENERATE_FREEZE` |
| `make test` | Run unit tests for all Python versions defined in `./setup.cfg`. Must be in `${PYTHON_MODULE_NAME}/tests/tests.py` | ✘ | |
| `make test-single` | Run unit tests for the default Python version. Must be in `${PYTHON_MODULE_NAME}/tests/tests.py` | ✘ | |
| `make update` | Update pre-commit hooks | ✓ | `OVERRIDE_UPDATE` |
| `make upload` | Upload the distribution files generated with `make dist` to PyPI | ✘ | |
| `make uninstall` | Remove the package from the user home | ✓ | `OVERRIDE_UNINSTALL` |
| `make uninstall-dev` | Remove the development environment | ✓ | `OVERRIDE_UNINSTALL_DEV` |

## Example

First of all install [curl](https://curl.se/). On Debian-based systems:

```shell
apt install curl
```

Create a [`.project.mk`](./.project.mk.example) file in your repository

```shell
curl -o .project.mk https://software.franco.net.eu.org/frnmst/python-makefile/raw/branch/master/.project.mk.example
```

In this example we are setting up the
[md-toc](https://software.franco.net.eu.org/frnmst/md-toc) project.

The name of the project is `md-toc` (with hyphen) but the Python module is
called `md_toc` (underscore). That is why there are two variables.

Add `Makefile` and `.dockerfile_build_python_dist` to your gitignore

```shell
echo 'Makefile' >> .gitignore
echo '.dockerfile_build_python_dist' >> .gitignore
```

Download the Makefile in your project

```
make -f .project.mk bootstrap
```

Now you can run the operations, for example

```shell
make install-dev
make test
```

You can also create new targets in [`.project.mk`](./.project.mk.example) and
run them

```shell
make example-target
```

Overriding is simple: just add your overridden target and the override variable
in the [`.project.mk`](./.project.mk.example) file.

## License

MIT License

Copyright (C) 2024 Franco Masotti (see /README.md)

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

## Changelog and trusted source

You can check the authenticity of new releases using my public key.

Changelogs, instructions, sources and keys can be found at
[blog.franco.net.eu.org/software/#md-toc](https://blog.franco.net.eu.org/software/#md-toc).

## Support this project

- [Buy Me a Coffee](https://www.buymeacoffee.com/frnmst)
- [Liberapay](https://liberapay.com/frnmst)
- Bitcoin: `bc1qnkflazapw3hjupawj0lm39dh9xt88s7zal5mwu`
- Monero: `84KHWDTd9hbPyGwikk33Qp5GW7o7zRwPb8kJ6u93zs4sNMpDSnM5ZTWVnUp2cudRYNT6rNqctnMQ9NbUewbj7MzCBUcrQEY`
- Dogecoin: `DMB5h2GhHiTNW7EcmDnqkYpKs6Da2wK3zP`
- Vertcoin: `vtc1qd8n3jvkd2vwrr6cpejkd9wavp4ld6xfu9hkhh0`
