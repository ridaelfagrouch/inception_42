FROM debian:buster

RUN apt -y update && apt install -y nginx && apt install openssl -y

COPY nginx.sh /

RUN chmod +x /nginx.sh

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/test.key -out /etc/nginx/ssl/test.crt -subj "/C=US/ST=CA/L=San Francisco/O=My Company/CN=${localhost}"


CMD [ "/nginx.sh" ]