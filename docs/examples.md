# Examples

## Start the development stage

* Copy `.env.dist` as `.env` and change values.
* Run `docker compose build --pull --no-cache` to build fresh images.
* Run `docker compose up` to start the containers. (the logs will be displayed in the current shell)

## Create another stage

* Copy `.env.dist` as `.env.[stage_name]` and change values.
* Create `docker-compose.[stage_name].yml` and extend or override services, network and volumens on demand.
*

RUN `docker compose --file docker-compose.yml --file docker-compose.[stage_name].yml --env-file .env.[stage_name] build --pull --no-cache`
to
build fresh images.

* RUN `docker compose --file docker-compose.yml --file docker-compose.[stage_name].yml --env-file .env.[stage_name] up`
  to start the containers.
  (the logs will be displayed in the current shell)

## Advanced environment handling

## Create an application with Symfony framework

* Build and start the development environment `make build`
* Start the development environment `make up`
* Open the browser and check access to the application `http://localhost`
* Open a shell in the `php` container `make exec/sh`
* Delete all in the directory `/srv/app` by `rm -r *`
* Create a Symfony project with `composer`
  by `composer create-project symfony/skeleton:"6.2.*" . --stability=stable --prefer-dist --no-progress --no-interaction`
* Optional: Install optional recipes eg. `composer require debug --prefer-dist --no-progress --no-interaction`
* Exit from shell and stop all running containers by `make down`
* Copy `.env.dist` as `.env` and change value of `PUBLIC_ROOT=/public`
* Enable `opcache` by editing the file `docker/php/fpm/php.ini` (uncomment the
  line `opcache.preload = /srv/app/config/preload.php`)
* Build new image fpr `php` container by `make build f=php`
* Start the development environment `make up`
* Optional: Uncomment the line `# - ${DOCUMENT_ROOT:-/srv/app}/vendor` in `docker-compose.override.yml`
* Open the browser and check access to the application `http://localhost`
