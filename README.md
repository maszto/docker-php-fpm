# PHP-FPM Docker container

This is a [maszto/docker-php-fpm](https://registry.hub.docker.com/u/maszto/docker-php-fpm/) docker container with tweaked PHP-FPM server.

Things included:

##### - directory structure
```
/data/log # meant to contain php log files
/data/run # run directory
```
The container will re-create above structure if it's missing - in case you'd use external /data volume.

##### - error logging

PHP-FPM `error_log` is set to `/data/log`.

#### - graceful reload after config change

Folders `/etc/php-fpm/` and `/data/conf/nginx/` are monitored for any config changes and, when they happen, Nginx is gracefully reloaded.


## Usage

`docker run -d -p=80:80 -p=443:443 million12/nginx`

With data container:  
```
docker run -d -v /data --name=web-data busybox
docker run -d --volumes-from=web-data -p=80:80 --name=web million12/nginx
```

