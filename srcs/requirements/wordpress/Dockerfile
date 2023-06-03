FROM debian:buster

RUN apt-get update \
    && apt-get install -y php7.3 php-mysql php-fpm \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

# Create the /run/php directory
RUN mkdir -p /run/php

# Install wp cli and download WordPress files
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download --allow-root


COPY wp-config.php /var/www/html/

# Set ownership and permissions for the WordPress files
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html


# Modify php-fpm config file to listen on port 9000 instead o
RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/9000/g' /etc/php/7.3/fpm/pool.d/www.conf



CMD ["php-fpm7.3", "-F"]
