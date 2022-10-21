# Notes

## Definition

A Docker-based installer and runtime for website applications.

## Current situation

* Der Initialaufwand für Docker Web Projekte ist für alle Entwickler ähnlich groß. Dabei gilt es den kleinsten
  gemeinsamen Nenner zu finden und diese Aufwände entsprechend zu reduzieren.

## Requirements

### Must Haves

* Minimalprinzip, welches bei Bedarf problemlos erweitert werden kann.
* Auch für bestehende Projekte nutzbar.

### Should Haves

* Einfache und nachvollziehbare Konfiguration.
* Umfangreich dokumentiert.

### Nice to Haves

* Nutzung von Best Practices.

## Links

* [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
* [Docker development best practices](https://docs.docker.com/develop/dev-best-practices/)

---

* Multi-staging and continous integration ready
* Using with existing projects
* Slim and minimal. Just 2 services (PHP FPM and Nginx)
* Extendable with extra services like Database, Cache etc.
* Super-readable Documentation
* Extendable services
    * Optional PHP Extensions like APCU, OPCache etc.
* Easy configuration with build options
    * Configurable network
    * Configurable versions for Nginx and PHP
    * Webserver
        * Automatic HTTPS
    * PHP FPM
        * Native XDebug integration

---