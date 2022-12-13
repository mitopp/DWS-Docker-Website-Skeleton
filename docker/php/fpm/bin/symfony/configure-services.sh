#!/bin/sh
set -e

# opcache
echo "Configure opcache..."
echo "opcache.preload = /srv/app/config/preload.php" >> /usr/local/etc/php/conf.d/docker-php.ini

# reload php-fpm service
pgrep php-fpm | xargs kill -USR2

# done
echo "Done."
