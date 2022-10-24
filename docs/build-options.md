# Build options

Der gesamte Compose Prozess kann durch verschiedene Variablen angepasst werden. Dazu werden sogenannte `ENV` Variablen
genutzt. Diese können entweder direkt im Compose Befehlt defineiert werden oder zentral durch eine `.env`Datei.

## Using the "--env-file" option

```shell
# Kopie der Ausgangsdatei erstellen.
$ cp .env.dist .env

# Variablen innerhalb der `.env` Datei ändern.
# Datei als Option übergeben und nutzen.
$ docker compose --env-file .env command
```

Dabei können auch unterschiedliche `.env` Dateien für unterschiedliche Environments genutzt werden. Docker Compose
berücksichtigt standardmäßig die `.env` Datei im Pfad der `docker-compose.yml`. By passing the file as an argument, you
can store it anywhere and name it appropriately, for example, `.env.ci`, `.env.prod`. [Passing the file path is
done using the `--env-file` option](https://docs.docker.com/compose/environment-variables/#using-the---env-file--option)

### Advanced usage

Durch die Verwendung von Standardwerten können auch nur einzelne Variablen definiert/überschrieben werden. 

Beispiel:

```shell
$ cat .env
COMPOSE_PROJECT_NAME=foobar
PORT_HTTP=80

$ cat .env.dev
PORT_HTTP=8080

$ docker compose --env-file .env --env-file .env-dev config
...
services:
  web:
    ...
    ports:
      80:8080
```

## Set environment variables by command

```shell
$ VARIABLE=value docker compose command
```

## Available variables and their default values

### Compose

| Variable                   | Default value | Description                                                                                                    |
|----------------------------|---------------|----------------------------------------------------------------------------------------------------------------|
| `COMPOSE_PROJECT_NAME`     | `null`        | Sets the project name. This value is prepended along with the service name to the container’s name on startup. |
| `COMPOSE_CONTAINER_PREFIX` | `dws`         | Dieses Prefix wird jedem Container-Namen vorangestellt.                                                        |

### Network

| Variable                | Default value | Description                                                                 |
|-------------------------|---------------|-----------------------------------------------------------------------------|
| `NETWORK_IP_V4_SUBNET`  | `10.0.0.0/24` | Dieser IP-Bereich wird für die Konfiguration des Netzwerkes genutzt. (IPV4) |
| `NETWORK_IP_V4_GATEWAY` | `10.0.0.1`    | Dieses Gateway  wird für die Konfiguration des Netzwerkes genutzt. (IPV4)   |

### Ports

| Variable                | Default value | Description                                     |
|-------------------------|---------------|-------------------------------------------------|
| `PORT_HTTP`             | `80`          | Dieser Port wird beim Webserver veröffentlicht. |

### Versions

| Variable                | Default value | Description                                    |
|-------------------------|---------------|------------------------------------------------|
| `VERSION_NGINX`         | `1.23.1`      | Diese Version des Webservers wird installiert. |