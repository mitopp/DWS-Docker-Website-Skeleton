# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG MARIADB_VERSION=10.9.4

# The different stages of this Dockerfile are meant to be built into separate images
# https://docs.docker.com/develop/develop-images/multistage-build/#stop-at-a-specific-build-stage
# https://docs.docker.com/compose/compose-file/#target
FROM mariadb:${MARIADB_VERSION} AS builder

# configuration
COPY conf.d /etc/mysql/conf.d
