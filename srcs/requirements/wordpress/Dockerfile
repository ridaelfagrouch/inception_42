FROM debian:buster

RUN apt-get update 
RUN apt-get install -y php7.3 php-mysql php-fpm
RUN rm -rf /var/lib/apt/lists/*

# Create the /run/php directory
RUN mkdir -p /run/php

WORKDIR /var/www/html

RUN rm -rf /var/www/html/*

# Install curl
RUN apt-get update && apt-get install -y curl

# RUN sleep 10
# Install wp cli and download WordPress files
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
# RUN chmod +x wp-cli.phar 
# RUN mv wp-cli.phar /usr/local/bin/wp
# RUN wp core download --allow-root

# RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php


# # change the wp-config.php file
# RUN sed -i 's/database_name_here/mydatabase/g' /var/www/html/wp-config.php
# RUN sed -i 's/username_here/rel-fagr/g' /var/www/html/wp-config.php
# RUN sed -i 's/password_here/123456789/g' /var/www/html/wp-config.php
# RUN sed -i 's/localhost/mariadb/g' /var/www/html/wp-config.php

COPY ./wordPress.sh /WordPress.sh

CMD ["bash", "/WordPress.sh"]
