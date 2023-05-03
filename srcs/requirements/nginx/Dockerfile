FROM debian:buster


RUN apt -y update && apt install -y nginx && apt install openssl -y

COPY nginx.sh /

RUN chmod +x /nginx.sh

CMD [ "/nginx.sh" ]