# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `MariaDB` service with profile `db`.
- `Adminer` service with profile `db`. (development only)
- `Mailcatcher` service with service `mail`. (development only)
- Documentation to profiles.
- `Redis` service with profile `cache`.
- Make: Targets for `debug` and `info`.
- PHP: `docker-entrypoint`
- Docs: Create an example for Symfony based applications
- PHP: Scripts for `create`, `install` and `configure` the Symfony framework
- Docker: Change context for `db`, `mail`, `web`
- PHP: Install `symfony/maker-bundle` for Symfony

### Changed

- PHP: Set default to latest stable version: `8.1.12` [Changelog](https://www.php.net/ChangeLog-8.php#8.1.12)
- Ignore `.env.*` files (sensitive data like credentials)
- Web: Rename host templates for better understanding
- Db: Use variables for `MARIADB_*` environments
- Container names for `adminer` and `mailer`
- Web: Rename ssl config file for better understanding
- Make: Add option for filter a container
- Documentation: for `redis.conf` and `docker.cnf`
- Docker: Image names
- Documentation in `.env.dist` and `docker/php/fpm/bin/docker-entrypoint.sh`
- PHP: Install vendor packages in `docker-entrypoint` not by default
- PHP: `opcache.preload` on demand
- PHP: Change directory owner in `docker-entrypoint`
- Make: Add target for container stats
- PHP: Upgrade to v8.1.13
- Web: Upgrade to v1.23.2
- Move `opcache` setting to general `php.ini`
- PHP: Copy Symfony scripts in the container
- Healthcheck: Tweak options
- PHP: Rename and optimize scripts for Symfony framework
- Web: Latest stable version: `1.23.3`

### Deprecated

### Removed

- Unused regex for `.env.dist` in `.dockerignore`
- Remove `opcache.preload` from `php.ini`
- Docker: Remove static container names for swarm mode
- Docker: Remove versions for build and set static in `Dockerfile`

### Fixed

- Make: Remove double argument for filter
- Make: Remove output in `all` target
- ENV: Add variable for `PORT_MAILER`
- Compose: Target and published ports
- Web: Typo in ssl config for development

### Security

## [1.1.0] - 2022-11-15

### Added

- Production: `docker-compose.prod.yml`
- `ENV` variables for web server config
- Nginx: SSL certificate generation for development.
- `index.php` in `app` directory, otherwise compose fails
- `DOCKER_BUILDKIT` as default
- `.gitattributes` for line endings
- Contribution guide
- `Makefile` support

### Changed

- Rename `.env` variables
- Documentation: `build-options` and `commands`
- `.editorconfig` for line endings and other
- Line endings
- Documentation: `troubleshooting` for different line endings
- Move volume for SSL certificates to development only
- Documentation: Link the contribution guide
- Prefix for `00-make-certs.sh` entrypoint for output

### Removed

- Self-signed SSL certificates
- Unused SSL variables in `.env.dist`
- Documentation: `index.php` is standard

### Fixed

- Documentation: Create another stages
- Long command in `make-certs.sh` entrypoint
- `.gitkeep` file for directory exists
- Typo in `make-certs.sh` with `HOSTNAME`
- Useless linebreak in `Dockerfile`
- Mount folder for self-signed certificates only for development

## [1.0.0] - 2022-10-27

### Added

- Documentation

## [0.3.0] - 2022-10-27

### Added

- Healthcheck for Nginx and PHP-FPM
- Logsys configuration
- `.dockerignore` #5

### Changed

- Nginx: Path of SSL certificates.
- Nginx: Enable routes for healthcheck.
- Move healthcheck from `Dockerfile` to `docker-compose`.
- Documenation

### Fixed

- The environment variable `COMPOSE_CONTAINER_PREFIX` is not working. #6

## [0.2.0] - 2022-10-25

### Added

- Compose file for development environment
- Template for Nginx Host
- PHP.ini configuration
- PHP FPM configuration
- PHP container
- `ENV` variables for Nginx host configuration
- Helpful commands
- Optional `ENV` variable to configure Xdebug in development PHP image.
- Custom entrypoint for PHP container

### Changed

- PHP: Advanced configuration with `Dockerfile`.
- Nginx: Advanced configuration with `Dockerfile`.
- Nginx: SSL configuration for development.

### Removed

- Image names and tags
- Custom entrypoint for PHP container

### Fixed

- Volume for the `php_socket` in `web` and `php` service ist configured as `bind`. Must be a volume and not a bind. #1
- Valid image tags. #3

## [0.1.0] - 2022-10-24

### Added

- Compose configuration for webserver (nginx)
- Configuration template as `.env.dist`
- Documentation
