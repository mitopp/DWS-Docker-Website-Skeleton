# DWS - Docker Website Skeleton

[![MIT License][license-shield]][license-url]
[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]

A Docker-based installer and runtime for website applications.

## Getting started

1. If not already done, [install Docker Compose](https://docs.docker.com/compose/install/) (v2.10+)
2. Run `docker compose build --pull --no-cache` to build fresh images
3. Run `docker compose up` (the logs will be displayed in the current shell)
4. Open `https://localhost` in your favorite web browser
   and [accept the auto-generated TLS certificate](https://stackoverflow.com/a/15076602/1352334)
5. Run `docker compose down --remove-orphans` to stop the Docker containers.

> For testing purposes, an `index.php` file with the content
> ```php
> <?php
> phpinfo();
> ```
> can be created in the app directory.

# Features

* Production, development and CI ready
* Healthcheck for containers
* Syslog integration
* Automatic HTTPS
* Super-readable and flexible configuration

# Requirements

* [Docker](https://docs.docker.com/get-docker/) v20.10.17 or higher
* [Docker Compose](https://docs.docker.com/compose/install/) v2.10.2 or higher

# Documentation

* [Build options](docs/build-options.md)
* [Usage examples](docs/examples.md)
* [Helpful commands](docs/commands.md)
* [Troubleshooting](docs/troubleshooting.md)

# Contributing

Please read the [Contribution guide](CONTRIBUTING.md) for further informations.

# License

Docker Website Skeleton is available under the [MIT License](LICENSE.md).

# Credits

Created by Michael Topp, co-maintained by Maik Caspar and Björn Grzywatz. Inspired
by [Kévin Dunglas](https://github.com/dunglas/symfony-docker)
and [Gary Clarke](https://github.com/GaryClarke/nginx-php7.4-mysql8-node-docker-network).


[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge

[contributors-url]: http://git.capita-europe.com/mitopp/dws-docker-website-skeleton/-/graphs/master

[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge

[license-url]: http://git.capita-europe.com/mitopp/dws-docker-website-skeleton/-/blob/master/LICENSE.md

[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge

[issues-url]: http://git.capita-europe.com/mitopp/dws-docker-website-skeleton/-/issues
