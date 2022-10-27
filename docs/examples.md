# Examples

## Start the development stage

* Copy `.env.dist` as `.env` and change values.
* Run `docker compose build --pull --no-cache` to build fresh images.
* Run `docker compose up` to start the containers. (the logs will be displayed in the current shell)

## Create another stage

* Copy `.env.dist` as `.env.[stage_name]` and change values.
* Create `docker-compose.[stage_name].yml` and extend or override services, network and volumens on demand.
* RUN `docker compose --file docker-compose.[stage_name].yml --env-file .env.[stage_name] build --pull --no-cache` to
  build fresh images.
* RUN `docker compose --file docker-compose.[stage_name].yml --env-file .env.[stage_name] up` to start the containers.
  (the logs will be displayed in the current shell)

## Advanced environment handling