<!--
SPDX-FileCopyrightText: 2024-2026 Franco Masotti (See /README.md)

SPDX-License-Identifier: MIT
-->

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/2.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!--TOC-->

- [Changelog](#changelog)
  - [\[Unreleased\]](#unreleased)
  - [\[0.4.0\] - 2026-10-06](#040---2026-10-06)
    - [Fixed](#fixed)
    - [Added](#added)
    - [Changed](#changed)
    - [Removed](#removed)
  - [\[0.3.0\] - 2026-09-25](#030---2026-09-25)
    - [Fixed](#fixed-1)
  - [\[0.2.0\] - 2026-09-09](#020---2026-09-09)
    - [Fixed](#fixed-2)
    - [Changed](#changed-1)
  - [\[0.1.0\] - 2026-06-24](#010---2026-06-24)
    - [Added](#added-1)
<!-- TOC by https://github.com/frnmst/md-toc ver. 9.1.0 -->

<!--TOC-->

## [Unreleased]

## [0.4.0] - 2026-10-06

### Fixed

- Dependency cooldown option now works only for compatible pip versions (>=26).
- Cleanup documentation.

### Added

- Add repository metadata files.

### Changed

- Repository structure now mirrors up-to-date standards.

### Removed

- Remove `latexpdf` from docs build commands because it's not used.

## [0.3.0] - 2026-09-25

### Fixed

- Add dependency cooldown option for pip-compile. See
  https://blog.pypi.org/posts/2026-04-02-incident-report-litellm-telnyx-supply-chain-attack/

## [0.2.0] - 2026-09-09

### Fixed

- Cleanup and fix readme.
  - Remove obsolete information.
  - Fix wording.

### Changed

- Makefile now uses more resilient instructions.

## [0.1.0] - 2026-06-24

### Added

- First release.
