FROM php:7

RUN apt-get update -yqq
RUN apt-get install git ruby -yqq

RUN curl -sS https://getcomposer.org/installer | php

RUN echo "memory_limit=1G" >> /usr/local/etc/php/conf.d/docker-php-ext-sodium.ini

RUN php composer.phar global config repositories.phpcs-diff vcs https://github.com/desyncr/phpcs-diff
RUN php composer.phar global require phpunit/phpunit ^7
RUN php composer.phar global require squizlabs/php_codesniffer
RUN php composer.phar global require phpro/grumphp

RUN php composer.phar global require olivertappin/phpcs-diff dev-support-ruleset-as-argument
RUN php composer.phar global require desyncr/grumphp-phpcs-diff ^0.0

RUN PATH="$HOME/.composer/vendor/bin:$PATH"
