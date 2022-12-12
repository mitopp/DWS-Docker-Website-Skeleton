#!/bin/sh
set -e

# opcache
echo "Configure opcache..."
echo "opcache.preload = /srv/app/config/preload.php" >> /usr/local/etc/php/conf.d/docker-php.ini

# done
echo "Done."
