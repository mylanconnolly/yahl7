# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `YAHL7::V2::Message` now has a `#to_s` method, which returns the original HL7
  message string. Useful for persisting the original message somewhere after
  processing.

## [0.1.0] - 2021-08-31

Initial release
