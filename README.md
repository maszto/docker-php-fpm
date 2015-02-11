# PHP-FPM Docker container

This is a [maszto/docker-php-fpm](https://registry.hub.docker.com/u/maszto/docker-php-fpm/) docker container with tweaked PHP-FPM server.

Things included:

##### - directory structure
```
/data/log # meant to contain web content
/data/run # run directory
```
The container will re-create above structure if it's missing - in case you'd use external /data volume.
