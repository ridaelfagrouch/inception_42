FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

# Set the ownership and permissions for the configuration file
RUN chown mysql:mysql /etc/mysql/mariadb.cnf
RUN chmod 644 /etc/mysql/mariadb.cnf

# Copy the custom initialization script
COPY ./conf/mariadb.sh /mariadb.sh

CMD ["bash", "/mariadb.sh"]