# Helpful commands

## Compose

```shell
# Converts the compose file to platform's canonical format

# Development environment
$ docker compose convert

# Review environment
$ docker compose --file docker-compose.rev.yml --env-file .env.rev convert

# Production environment
$ docker compose --file docker-compose.prod.yml --env-file .env.prod convert
```