FROM maszto/docker-centos-supervisor:latest
MAINTAINER Dawid Szymczak dawid.szymczak@masz.to

# - Install PHP and PHP-FPM
# - Add user/group www:www
RUN \
  yum install -y yum-utils && \

  rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
  rpm -Uvh https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm && \

  yum-config-manager -q --enable remi && \
  yum-config-manager -q --enable remi-php56 && \

  yum install -y php-fpm php-bcmath php-cli php-gd php-intl php-mbstring \
                  php-mcrypt php-mysql php-opcache php-pdo && \
  yum install -y --disablerepo=epel php-pecl-redis php-pecl-memcached php-pecl-yaml php-pecl-imagick && \

  yum install -y newrelic-sysmond && \
  yum install -y newrelic-php5 && \

  yum clean all && \

  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
  chown www /usr/local/bin/composer

  groupadd --gid 80 www && \
  useradd --uid 80 --home /data/www --gid 80 --shell /bin/bash --comment www nginx

ADD container-files /

EXPOSE 9000
