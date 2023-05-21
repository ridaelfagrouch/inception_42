FROM debian:buster

RUN apt-get update \
    && apt-get install -y php7.3 php-mysql wordpress \
    && rm -rf /var/lib/apt/lists/*

COPY wp-config.php /var/www/html/

# adding the following line to your httpd.conffile: ServerName localhost
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf


CMD ["apache2ctl", "-D", "FOREGROUND"]

