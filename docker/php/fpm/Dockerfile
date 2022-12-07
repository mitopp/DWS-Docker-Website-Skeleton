# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG PHP_VERSION=8.1.13

# The different stages of this Dockerfile are meant to be built into separate images
# https://docs.docker.com/develop/develop-images/multistage-build/#stop-at-a-specific-build-stage
# https://docs.docker.com/compose/compose-file/#target
FROM php:${PHP_VERSION}-fpm-alpine AS builder

# persistent / runtime deps
RUN apk add --no-cache \
		acl \
		fcgi \
		file \
		gettext \
		git \
	;

# Useful PHP extension installer image, copy binary into your container
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# php extensions
RUN set -eux; \
    install-php-extensions \
    	intl \
    	zip \
    	apcu \
		opcache \
    ;

# ini handling
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY docker/php/fpm/conf.d/php.ini /usr/local/etc/php/conf.d/docker-php.ini

# conf handling
COPY docker/php/fpm/php-fpm.conf /usr/local/etc/php-fpm.d/zz-docker.conf

# composer
# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1

# obtain composer using multi-stage build
# https://docs.docker.com/build/building/multi-stage/
COPY --from=composer:2.4 /usr/bin/composer /usr/bin/composer

ARG DOCUMENT_ROOT="/srv/app"

# copy sources
COPY app/ ${DOCUMENT_ROOT}

# entry point
COPY docker/php/fpm/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["php-fpm"]

########################################################################################################################
# Production image
########################################################################################################################
FROM builder AS prod

# ini handling
COPY docker/php/fpm/conf.d/php-production.ini /usr/local/etc/php/conf.d/docker-php-production.ini

########################################################################################################################
# Development image
########################################################################################################################
FROM builder AS dev

ENV XDEBUG_MODE=off

# ini handling
COPY docker/php/fpm/conf.d/php-development.ini /usr/local/etc/php/conf.d/docker-php-development.ini

# xdebug
RUN set -eux; \
	install-php-extensions xdebug
