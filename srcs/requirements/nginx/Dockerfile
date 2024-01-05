FROM debian:bullseye

# Updates the package list, installs Nginx and OpenSSL, cleans up unnecessary files, and creates a directory for SSL configuration.
RUN apt update && \ 
    apt install nginx openssl -yq && \
    apt-get clean && \ 
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/sites-available/default

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/privatekey.key -out /etc/ssl/certs/certificate.crt -subj "/C=PT/L=Lisboa/O=42Lisboa/OU=Student/CN=mgranate.42.fr"

CMD [ "nginx", "-g", "daemon off;" ]
#-g this option is used to specify global configurations for Nginx
#"daemon off;", which tells Nginx to run in the foreground, preventing it from detaching and running as a background daemon.
