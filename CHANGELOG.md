# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Compose file for development environment
- Template for Nginx Host
- PHP.ini configuration
- PHP FPM configuration
- PHP container
- `ENV` variables for Nginx host configuration
- Helpful commands

### Changed

- PHP: Advanced configuration with `Dockerfile`.

### Deprecated

### Removed

### Fixed

- Volume for the `php_socket` in `web` and `php` service ist configured as `bind`. Must be a volume and not a bind. #1

### Security

## [0.1.0] - 2022-10-24

### Added

- Compose configuration for webserver (nginx)
- Configuration template as `.env.dist`
- Documentation