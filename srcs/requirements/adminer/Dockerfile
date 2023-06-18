FROM debian:buster

RUN apt update -y && apt install -y php php-mysql && apt install -y wget && wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

RUN rm -rf /var/www/html/index.html
RUN chown www-data:www-data /var/www/html/adminer.php
RUN chmod 777 /var/www/html/adminer.php

CMD ["php", "-S", "0.0.0.0:3000", "-t", "/var/www/html"]