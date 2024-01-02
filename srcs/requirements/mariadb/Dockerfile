# This line sets the base image to Debian Buster, which is a lightweight and popular base image for Docker containers.
FROM debian:Bookworm

RUN apt update && \ 
    apt install mariadb-server -yq && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY conf/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

ENTRYPOINT /tmp/setup.sh