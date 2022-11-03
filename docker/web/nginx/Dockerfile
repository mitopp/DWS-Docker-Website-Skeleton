# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG NGINX_VERSION=1.23.1

# The different stages of this Dockerfile are meant to be built into separate images
# https://docs.docker.com/develop/develop-images/multistage-build/#stop-at-a-specific-build-stage
# https://docs.docker.com/compose/compose-file/#target
FROM nginx:${NGINX_VERSION}-alpine AS builder

# vhost
COPY docker/web/nginx/templates/localhost.conf.template /etc/nginx/templates/default.conf.template

########################################################################################################################
# Production image
########################################################################################################################
FROM builder AS prod

########################################################################################################################
# Development image
########################################################################################################################
FROM builder AS dev

RUN apk add --no-cache --update \
    openssl \

# Generate self-signed SSL certificates
COPY docker/web/nginx/conf/dev.cnf /etc/ssl/dev.cnf
COPY docker/web/nginx/bin/make-certs.sh /docker-entrypoint.d/00-make-certs.sh

RUN chmod +x /docker-entrypoint.d/00-make-certs.sh
RUN mkdir /etc/nginx/ssl && touch /etc/nginx/ssl/.nomount
