#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

if [ "$1" = 'php-fpm' ] || [ "$1" = 'php' ] || [ "$1" = 'bin/console' ]; then
	# Check if a `composer.json` file exists,
	# but a `vendor` directory does not exists,
	# install required packages.
	if [ -f composer.json ] && [ ! -d vendor ]; then
		echo "Install vendor packages required!"
		composer install --prefer-dist --no-progress --no-interaction
	fi
fi

exec docker-php-entrypoint "$@"
