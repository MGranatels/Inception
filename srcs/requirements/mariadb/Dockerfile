FROM debian:bullseye

RUN apt update && \ 
    apt install mariadb-server -yq && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copies the setup.sh script from the local 'conf' directory to the '/tmp' directory inside the Docker image.
COPY conf/setup.sh /tmp/setup.sh

# Grants execute permissions to the setup.sh script.
RUN chmod +x /tmp/setup.sh

# Specifies that the '/tmp/setup.sh' script should be executed when a container is started.
ENTRYPOINT /tmp/setup.sh