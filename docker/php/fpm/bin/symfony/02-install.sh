#!/bin/sh
set -e

# arguments
# 1: environment	(default: dev)

# install packages
echo "Install packages..."
if [ "${1:-"dev"}" = 'dev' ]; then
	composer install --prefer-dist --no-progress --no-interaction;
else
	composer install --prefer-dist --no-dev --no-autoloader --no-scripts --no-progress;
	composer dump-autoload --classmap-authoritative --no-dev;
	composer dump-env prod;
	composer run-script --no-dev post-install-cmd;
fi

composer clear-cache

# done
echo "Done."
