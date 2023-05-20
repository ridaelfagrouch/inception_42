# FROM debian:buster

# WORKDIR /etc/mysql

# # Copy the configuration file
# COPY conf/mariadb.cnf /etc/mysql/mariadb.cnf

# # Copy the script
# COPY ./mariadb.sh /home/mariadb.sh

# RUN chmod +x /home/mariadb.sh

# ENTRYPOINT ["bash", "/home/mariadb.sh"]

# CMD ["mysqld"]

FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

# Copy the custom configuration file
# COPY mariadb.cnf /etc/mysql/mariadb.cnf

# Set the ownership and permissions for the configuration file
# RUN chown mysql:mysql /etc/mysql/mariadb.cnf
# RUN chmod 644 /etc/mysql/mariadb.cnf



# Copy the custom initialization script
COPY mariadb.sh /docker-entrypoint-initdb.d/mariadb.sh

ENTRYPOINT ["bash", "/docker-entrypoint-initdb.d/mariadb.sh"]
# Set executable permissions for the initialization script
# RUN chmod +x /docker-entrypoint-initdb.d/mariadb.sh

# Start the MariaDB service
CMD ["mysqld"]

