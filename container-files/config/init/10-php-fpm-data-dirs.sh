#!/bin/sh

#
# This script will be placed in /config/init/ and run when container starts.
# It creates (if they're not exist yet) necessary directories
# from where custom Nginx configs can be loaded (from mounted /data volumes).
#

set -e

mkdir -p /data/log/php-fpm
mkdir -p /data/run/php-fpm
chmod 711 /data/log/php-fpm
chmod 711 /data/run/php-fpm

chown -R www:www /data/log/php-fpm
chown -R www:www /data/run/php-fpm
