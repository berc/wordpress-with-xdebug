FROM php

MAINTAINER Rastislav Bertusek <rastislav.bertusek@gmail.com>

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install php5-mysql php5-gd php-pear php-apc php5-curl curl lynx-cur

RUN docker-php-ext-install mysqli mbstring

RUN pecl install xdebug-beta
RUN docker-php-ext-enable xdebug

RUN echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini
RUN echo xdebug.remote_enable=1 >> /usr/local/etc/php/conf.d/xdebug.ini; \
    echo xdebug.remote_autostart=0 >> /usr/local/etc/php/conf.d/xdebug.ini; \
    echo xdebug.remote_connect_back=1 >> /usr/local/etc/php/conf.d/xdebug.ini; \
    echo xdebug.remote_port=9000 >> /usr/local/etc/php/conf.d/xdebug.ini; \
    echo xdebug.remote_log=/tmp/php5-xdebug.log >> /usr/local/etc/php/conf.d/xdebug.ini;

RUN echo 'date.timezone = Europe/Berlin' > /usr/local/etc/php/conf.d/date.ini
