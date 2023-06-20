FROM debian:buster

RUN apt -y update && apt install -y nginx

COPY ./conf/nginx.sh /

RUN chmod +x /nginx.sh

RUN mkdir -p /var/www/html/websiteFiles && chown -R www-data:www-data /var/www/html/websiteFiles

COPY ./websiteFiles /var/www/html/websiteFiles

CMD [ "/nginx.sh" ]