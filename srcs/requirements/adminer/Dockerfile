#setup adminer dockerfile
FROM debian:buster

RUN apt-get update && apt-get install -y wget
RUN apt-get install -y php7.3 php-mysql php-fpm
RUN rm -rf /var/lib/apt/lists/*

# Create the /run/php directory
RUN mkdir -p /run/php

WORKDIR /var/www/html

RUN rm -rf /var/www/html/*

# Install curl
RUN apt-get update && apt-get install -y curl

COPY ./conf/adminer.sh /adminer.sh

CMD ["bash", "/adminer.sh"]


