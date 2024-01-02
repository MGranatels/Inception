# Use the official Debian base image
FROM debian:Bookworm

RUN apt-get update && apt-get -y install \
	curl \
	php-mysqli \
	php-fpm \
	&& rm -rf /var/lib/apt/lists/*


# Get wp cli to core install and use
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
# Create a directory for PHP runtime files to enable PHP to start correctly
RUN mkdir /run/php

COPY ./conf/setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh
ENTRYPOINT [ "/usr/local/bin/setup.sh" ]

WORKDIR /var/www/html/
