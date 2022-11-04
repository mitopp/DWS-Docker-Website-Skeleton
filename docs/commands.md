# Helpful commands

## Compose

```shell
# Converts the compose file to platform's canonical format

# Development environment
$ docker compose convert

# Review environment
$ docker compose --file docker-compose.yml --file docker-compose.rev.yml --env-file .env.rev convert

# Production environment
$ docker compose --file docker-compose.yml --file docker-compose.prod.yml --env-file .env.prod convert
```

## Other

```shell
# Test the PHP-FPM configuration
$ docker exec -it dws-php php-fpm -tt

# Test the Nginx configuration
$ docker exec -it dws-nginx nginx -T
```