# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- HL7 data types:
  - `XCN` for extended composite names
- The `CNN` data type now has a `#full_name` method to match `XPN` and `XCN`.
- The `NDL` data type now has a `#full_name` method to match `XPN` and `XCN`.
- The segment type now overrides `#to_s`

### Changed

- Mapped the following fields to the `XCN` data type:
  - `DG1.16`
  - `EVN.5`
  - `IN1.30`
  - `OBR.10`
  - `OBR.16`
  - `OBR.28`
  - `OBX.16`
  - `ORC.10`
  - `ORC.11`
  - `ORC.12`
  - `ORC.19`
  - `PD1.4`
  - `PV1.7`
  - `PV1.8`
  - `PV1.9`
  - `PV1.17`
  - `PV1.52`

### Fixed

- Messages now display body correctly.
- The `NDL` data type did not play well with some implementations that do not
  include all field values.

## [0.4.0] - 2021-09-01

### Added

- HL7 data types:
  - `TQ` for timing and quantity

### Changed

- Mapped the following fields to the `TQ` data type:
  - `OBR.27`
  - `ORC.7`

## [0.3.3] - 2021-09-01

This version comes with a few bugfixes

### Fixed

- The mapping order of MSH fields was incorrect.
- When `YAHL7::V2::FieldParser` was given a `nil` value, the program could
  crash. This condition should now be resolved.

## [0.3.2] - 2021-09-01

0.3.1 introduced a bug that is fixed in this release.

### Fixed

- A bug in 0.3.1. We should have returned `YAHL7::V2::Message` but `nil` was
  returned instead, resulting in an inconsistent API. This release fixed that
  behavior and makes the API consistent again.

## [0.3.1] - 2021-09-01

This release fixes a bug under certain circumstances. More details are listed
below.

### Fixed

- A bug that could be encountered where messages that do not contain a message
  type field caused a crash. This crash should now be fixed. When calling
  `YAHL7::V2::Message.message_type` on a message body that does not contain the
  type field, `nil` should now be returned rather than crashing.

## [0.3.0] - 2021-08-31

The most significant part of this release is the addition of HL7 data types,
which should allow us to access data within the messages in a much more
convenient fashion.

### Added

- `YAHL7::V2::Error::InvalidFormatError` error class for when invalid input was
  encountered during parsing.
- HL7 segments:
  - `AL1` for patient allergy information
  - `DG1` for patient diagnosis information
  - `EVN` to describe event triggers
- HL7 data types:
  - `CNN` for composite ID number and name fields
  - `DT` for dates
  - `FT` for formatted text
  - `NDL` for name, date, and location
  - `TS` for timestamps
  - `XAD` for extended addresses
  - `XPN` for extended person names
  - `XTN` for extended telephone numbers

### Changed

- `DateTime::parse` now raises `YAHL7::V2::Error::InvalidFormatError` on an
  unknown format rather than the default `RuntimeError`.
- Rename `YAHL7::V2::SegmentFieldNames` to `YAHL7::V2::AliasFieldNames` because
  it is useful in custom data types as well as segments.
- Map created HL7 data types to applicable fields in segments.

## [0.2.0] - 2021-08-31

### Added

- `YAHL7::V2::Message` now has a `#to_s` method, which returns the original HL7
  message string. Useful for persisting the original message somewhere after
  processing
- `IN1` segment type
- `PD1` segment type

## [0.1.0] - 2021-08-31

Initial release
