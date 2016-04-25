FROM myorb/docker-php-kit

MAINTAINER "Alex ZeroDay" <itdep@gmail.com>

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y curl git php5-mcrypt php5-gd && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update && \
    apt-get remove --purge curl -y && \
    apt-get clean

RUN mkdir -p /data
VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["composer"]
CMD ["--help"]

