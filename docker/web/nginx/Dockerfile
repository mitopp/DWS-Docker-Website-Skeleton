# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG NGINX_VERSION=1.23.1

# The different stages of this Dockerfile are meant to be built into separate images
# https://docs.docker.com/develop/develop-images/multistage-build/#stop-at-a-specific-build-stage
# https://docs.docker.com/compose/compose-file/#target
FROM nginx:${NGINX_VERSION}-alpine AS builder

########################################################################################################################
# Production image
########################################################################################################################
FROM builder AS prod

# healthcheck
HEALTHCHECK --interval=60s --timeout=10s --retries=5 CMD curl --fail http://localhost || exit 1

########################################################################################################################
# Development image
########################################################################################################################
FROM builder AS dev

# vhost
COPY docker/web/nginx/templates/localhost.conf.template /etc/nginx/templates/default.conf.template

# healthcheck
HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD curl --fail http://localhost || exit 1