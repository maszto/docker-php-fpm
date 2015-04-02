FROM maszto/docker-centos-supervisor:latest
MAINTAINER Dawid Szymczak dawid.szymczak@masz.to

# - Add user/group www:www
# - Install PHP and PHP-FPM
RUN \

  groupadd --gid 80 www && \
  useradd --uid 80 --home /data/www --gid 80 --shell /bin/bash --comment www www && \

  yum install -y yum-utils && \

  rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
  rpm -Uvh https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm && \

  yum-config-manager -q --enable remi && \
  yum-config-manager -q --enable remi-php56 && \

  yum install -y php-fpm php-bcmath php-cli php-gd php-intl php-mbstring php-soap \
                  php-mcrypt php-mysql php-opcache php-pdo php-pecl-http && \
  yum install -y --disablerepo=epel php-pecl-redis php-pecl-memcached php-pecl-yaml php-pecl-imagick php-pecl-xdebug && \

  yum install -y newrelic-sysmond && \
  yum install -y newrelic-php5 && \

  yum clean all && \

  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
  chown www /usr/local/bin/composer

ADD container-files /

EXPOSE 9000
EXPOSE 9090
