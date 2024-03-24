# python-makefile
# MIT License
# Copyright (C) 2024 Franco Masotti (see /README.md)
# https://software.franco.net.eu.org/frnmst/python-makefile

# Change these two. Required.
PROJECT_NAME := python-makefile
PYTHON_MODULE_NAME := python_makefile

# Required.
MAKEFILE_SOURCE := https://software.franco.net.eu.org/frnmst/python-makefile/raw/branch/master/Makefile.example
bootstrap:
	curl -o Makefile $(MAKEFILE_SOURCE)
