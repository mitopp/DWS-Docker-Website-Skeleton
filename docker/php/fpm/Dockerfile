# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG PHP_VERSION=8.1.11

# The different stages of this Dockerfile are meant to be built into separate images
# https://docs.docker.com/develop/develop-images/multistage-build/#stop-at-a-specific-build-stage
# https://docs.docker.com/compose/compose-file/#target
FROM php:${PHP_VERSION}-fpm-alpine AS builder

# php extensions installer: https://github.com/mlocati/docker-php-extension-installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions

# persistent / runtime deps
RUN apk add --no-cache \
		acl \
		fcgi \
		file \
		gettext \
		git \
	;

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

# healthcheck
COPY docker/php/fpm/bin/docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck

# composer
# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer




########################################################################################################################
# Production image
########################################################################################################################
FROM builder AS prod

# ini handling
COPY docker/php/fpm/conf.d/php-production.ini /usr/local/etc/php/conf.d/docker-php-production.ini

# copy sources
COPY app/ .

# healthcheck
HEALTHCHECK --interval=60s --timeout=10s --retries=5 CMD ["docker-healthcheck"]

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

# healthcheck
HEALTHCHECK --interval=10s --timeout=3s --retries=3 --start-period=10s CMD ["docker-healthcheck"]
