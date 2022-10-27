# Build options

The whole Compose process can be customized by different variables. For this purpose so-called `ENV` variables
are used. These can be defined either directly in the Compose command or centrally by a `.env` file.

## Using the "--env-file" option

```shell
# Create a copy of the source file.
$ cp .env.dist .env

# Change variables within the `.env` file and use file as an option.
$ docker compose --env-file .env command
```

This can also use different `.env` files for different environments. Docker Compose
takes into account the `.env` file in the `docker-compose.yml` path by default. By passing the file as an argument, you
can store it anywhere and name it appropriately, for example, `.env.ci`, `.env.prod`. [Passing the file path is
done using the `--env-file` option](https://docs.docker.com/compose/environment-variables/#using-the---env-file--option)

### Advanced usage

By using default values also only single variables can be defined/overwritten.

Example:

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
| `COMPOSE_CONTAINER_PREFIX` | `dws`         | This prefix is prepended to each container name.                                                               |
| `COMPOSE_DOCUMENT_ROOT`    | `/srv/app`    | Root directory for the web server.                                                                             |
| `COMPOSE_PUBLIC_ROOT`      | `/`           | Public directory for the web server.                                                                           |

### Network

| Variable                | Default value | Description                                                        |
|-------------------------|---------------|--------------------------------------------------------------------|
| `NETWORK_IP_V4_SUBNET`  | `10.0.0.0/24` | This IP range is used for the configuration of the network. (IPV4) |
| `NETWORK_IP_V4_GATEWAY` | `10.0.0.1`    | This gateway is used for the configuration of the network. (IPV4)  |

### Ports

| Variable     | Default value | Description                               |
|--------------|---------------|-------------------------------------------|
| `PORT_HTTP`  | `80`          | This port is published at the web server. |
| `PORT_HTTPS` | `443`         | This port is published at the web server. |

### Versions

| Variable        | Default value | Description                                            |
|-----------------|---------------|--------------------------------------------------------|
| `VERSION_NGINX` | `1.23.1`      | This version of the web server is installed.           |
| `VERSION_PHP`   | `8.1.11`      | This version of PHP FPM is installed in the container. |

### Syslog

| Variable     | Default value                        | Description                           |
|--------------|--------------------------------------|---------------------------------------|
| `SYSLOG_URI` | `tcp://syslog.capita-europe.com:514` | The URI to the central Syslog server. |

### Other

| Variable      | Default value | Description                                    |
|---------------|---------------|------------------------------------------------|
| `XDEBUG_MODE` | `off`         | Configures the Xdebug mode. (Development only) |