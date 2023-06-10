#!/bin/bash

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php


# change the wp-config.php file
sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wp-config.php
sed -i "s/username_here/$DB_USER/g" /var/www/html/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" /var/www/html/wp-config.php
sed -i 's/localhost/mariadb/g' /var/www/html/wp-config.php
# Install WordPress
wp core install --allow-root --url=localhost --title="My WordPress Site" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL

wp user create --allow-root $USER_NAME $USER_EMAIL --user_pass=$USER_PASSWORD --role=author


# Set ownership and permissions for the WordPress files
# chown -R www-data:www-data /var/www/html
# chmod -R 755 /var/www/html

# Modify php-fpm config file to listen on port 9000 instead of using a socket
sed -i 's/\/run\/php\/php7.3-fpm.sock/9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# Start php-fpm
php-fpm7.3 -F