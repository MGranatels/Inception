# Use the official Debian base image
FROM debian:bullseye

# Install necessary packages (curl, php-mysqli, php-fpm) and clean up unecessary files
RUN apt-get update && apt-get -y install \
	curl \
	php-mysqli \
	php-fpm \
	&& rm -rf /var/lib/apt/lists/*

# Downloads and installs WordPress CLI (WordPress Command Line Interface) for managing WordPress installations.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create a directory for PHP runtime files to enable PHP to start correctly
RUN mkdir /run/php

COPY ./conf/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

#Defines the entry point for the container, specifying that the setup.sh script should be executed when the container starts.
ENTRYPOINT [ "/usr/local/bin/setup.sh" ]

#Sets the working directory to /var/www/html/, which is a common directory for web server document roots.	
WORKDIR /var/www/html/
