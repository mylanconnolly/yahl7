# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

The most significant part of this release is the addition of HL7 data types,
which should allow us to access data within the messages in a much more
convenient fashion.

### Added

- `YAHL7::V2::Error::InvalidFormatError` error class for when invalid input was
  encountered during parsing.
- HL7 data types:
  - `CNN` for composite ID number and name fields
  - `DT` for dates
  - `TS` for timestamps
  - `XPN` for extended person names

### Changed

- `DateTime::parse` now raises `YAHL7::V2::Error::InvalidFormatError` on an
  unknown format rather than the default `RuntimeError`.
- Rename `YAHL7::V2::SegmentFieldNames` to `YAHL7::V2::AliasFieldNames` because
  it is useful in custom data types as well as segments.

## [0.2.0] - 2021-08-31

### Added

- `YAHL7::V2::Message` now has a `#to_s` method, which returns the original HL7
  message string. Useful for persisting the original message somewhere after
  processing
- `IN1` segment type
- `PD1` segment type

## [0.1.0] - 2021-08-31

Initial release
