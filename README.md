# PHP-FPM Docker container

### Inspired by [million12/docker-centos-supervisor](https://github.com/million12/docker-centos-supervisor) Thank You for awesome piece of work.

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

`docker run -d -p=9000:9000 --name php-fpm maszto/docker-php-fpm`

With data container:  
```
docker run -d -v /data --name=web-data busybox
docker run -d --volumes-from=web-data -p=9000:9000 --name=php-fpm maszto/docker-php-fpm
```

With data container from localdrive:  
```
docker run -d -v /data:/data:ro --name=web-data busybox
docker run -d --volumes-from=web-data -p=9000:9000 --name=php-fpm maszto/docker-php-fpm
```


