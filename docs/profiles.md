# Profiles

Profiles allow adjusting the Compose application model for various usages and environments by selectively enabling
services. This is achieved by assigning each service to zero or more profiles. If unassigned, the service is always
started but if assigned, it is only started if the profile is activated.

## Available profiles

| Profile name | Service       | Environment      |
|--------------|---------------|------------------|
| (unassigned) | web (nginx)   | all              |
| (unassigned) | php (php-fpm) | all              |
| db           | db (mariadb)  | all              |
| db           | adminer       | development only |
| mail         | mailcatcher   | development only |

## Enabling profiles

To enable a profile supply the `--profile` command line option or use the `COMPOSE_PROFILES` environment variable.
Multiple profiles can be specified by passing multiple `--profile` flags or a comma-separated list for the
`COMPOSE_PROFILES` environment variable:

```shell
$ docker compose --profile db --profile mail up
$ COMPOSE_PROFILES=db,mail docker compose up

# Make
$ make compose/"--profile db --profile mail up"
```

## Links

- [Using profiles with Compose](https://docs.docker.com/compose/profiles/)
