# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed
- Fixed null type casting error in DataList operations that caused `_TypeError (type 'Null' is not a subtype of type 'DataList' in type cast)`

## [1.0.3] - 2024-05-27

### Fixed
- Fixed example code implementation and resolved analyzer warnings
- Improved code documentation and examples

## [1.0.2] - 2024-05-27

### Fixed
- Resolved static analyzer warnings and improved code quality
- Enhanced type safety throughout the codebase

## [1.0.1] - 2024-05-27

### Fixed
- Updated README demo images and documentation
- Improved visual examples and usage guides

## [1.0.0] - 2024-05-27

### Changed
- **BREAKING**: Updated to Flutter 3.32.0 compatibility
- Updated Gradle configuration for future compatibility
- Reset Android folder structure for better maintainability

### Improved
- Enhanced overall project structure and build system

## [0.4.9+1] - 2020-11-11

### Fixed
- Resolved issue #66 related to tag rendering
- Fixed `DataList` null identifier handling

## [0.4.9] - 2020-09-15

### Added
- Configurable padding for `textField` component
- Enhanced customization options for text input areas

## [0.4.8+2] - 2020-06-02

### Documentation
- Updated API documentation and usage examples
- Improved inline code comments

## [0.4.8+1] - 2020-05-13

### Documentation
- Enhanced README with better examples
- Added more comprehensive API documentation

## [0.4.8] - 2020-03-07

### Documentation
- Updated documentation structure
- Improved code examples and usage guides

## [0.4.7] - 2020-02-26

### Changed
- General code improvements and optimizations
- Enhanced code readability and maintainability

### Documentation
- Updated comprehensive documentation

## [0.4.6] - 2020-02-26

### Added
- TextField enable/disable functionality (resolves #36)
- `constraintSuggestion` field for adding custom tags not in suggestions (resolves #33)
- Enhanced tag removal controls with boolean return type

### Changed
- **BREAKING**: Moved `onRemoved` field inside `ItemTagsRemoveButton()` for consistency
- `onRemoved` now returns boolean for removal validation

### Fixed
- Various stability improvements

## [0.4.5] - 2019-10-30

### Changed
- **BREAKING**: Renamed `TagstextField` to `TagsTextField` for consistency

### Added
- `textCapitalization` support in `TagsTextField`

## [0.4.4] - 2019-10-16

### Added
- `child` field in `ItemTagsImage()` for enhanced image control
- Global access to all `ItemTags` via `GlobalKey<TagsState>`

### Fixed
- TextField and suggestions alignment issues (resolves #31)

### Documentation
- Major documentation updates with new features

## [0.4.3] - 2019-07-28

### Removed
- **BREAKING**: Removed `position` parameter from `TagsTextField()` (use `verticalDirection` and `TextDirection` in `Tags()` instead)

### Fixed
- Various stability improvements

### Documentation
- Minor documentation updates

## [0.4.2] - 2019-07-27

### Improved
- General code quality improvements
- Enhanced performance optimizations

### Documentation
- Updated comprehensive documentation

## [0.4.1] - 2019-07-27

### Documentation
- Minor documentation updates

## [0.4.0] - 2019-07-27

### Changed
- **BREAKING**: Complete architecture redesign
- **BREAKING**: Removed `SelectableTags` and `InputTags` - unified into single `Tags()` widget

### Added
- Individual tag customization with icons, images, and removal buttons
- Horizontal scroll support for tag lists
- Enhanced tag personalization options

### Documentation
- Major documentation overhaul with new structure

## [0.3.2] - 2019-06-20

### Added
- `customData` field in Tag class for additional data storage

### Fixed
- Resolved issues #14 and #13

## [0.3.1] - 2019-05-13

### Improved
- General code quality improvements
- Enhanced performance and stability

## [0.3.0] - 2019-04-09

### Added
- Customizable popup menu functionality
- **SelectableTags**: Individual color and activeColor configuration
- **InputTags**: Option to hide textField

## [0.2.4] - 2019-04-08

### Fixed
- Various stability improvements

## [0.2.3] - 2019-04-05

### Changed
- Made `onInsert`, `onDelete`, and `onPressed` callbacks optional

### Improved
- General code quality improvements

## [0.2.2] - 2019-03-02

### Added
- `textStyle` property in InputTags and SelectableTags
- InputSuggestions component (early implementation)

### Changed
- **BREAKING**: Removed `textColor` from InputTags (use `textStyle` instead)
- **BREAKING**: Color handling in SelectableTags (use `textColor`/`textActiveColor` instead of `color` in `textStyle`)

### Improved
- Major code refactoring and improvements

## [0.2.1] - 2019-03-01

### Improved
- **BREAKING**: Major code rewrite for better performance
- Significantly improved tag width calculation accuracy

## [0.2.0] - 2019-02-24

### Added
- Configurable margin and padding for close icon in InputTags

### Improved
- Enhanced tag width calculation algorithm

## [0.1.9] - 2019-02-23

### Improved
- Width calculation based on byte length of title
- Automatic screen width recalculation on orientation changes

## [0.1.8] - 2019-02-16

### Documentation
- Improved library documentation

## [0.1.7] - 2019-02-07

### Added
- SingleItem feature for SelectableTags
- Customizable icon colors for InputTags

### Improved
- General code improvements

## [0.1.6] - 2019-01-07

### Fixed
- "Infinity or NaN toInt" error in InputTags

### Improved
- General code improvements

## [0.1.5] - 2018-12-24

### Improved
- General code quality improvements

## [0.1.4] - 2018-12-18

### Added
- New features and functionality

## [0.1.3] - 2018-12-16

### Added
- Highlight feature for InputTags

### Improved
- General code improvements

## [0.1.2] - 2018-12-15

### Added
- InputTags widget

### Documentation
- Improved documentation

## [0.1.1] - 2018-12-08

### Documentation
- Improved documentation

## [0.1.0] - 2018-12-08

### Documentation
- Updated README

## [0.0.1] - 2018-12-08

### Added
- Initial release with Selectable Tags functionality
