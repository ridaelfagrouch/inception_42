#!/bin/bash

/etc/init.d/mysql start

# Set the bind address to 0.0.0.0 to allow connections from all IP addresses
sed -i "s/bind-address.*/bind-address = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf


# Execute your custom initialization commands here
# For example, create a new database and user
# sleep 100000
mysql -u root <<EOSQL
    CREATE DATABASE mydatabase;
    CREATE USER 'rel-fagr'@'%' IDENTIFIED BY '123456789';
    GRANT ALL PRIVILEGES ON mydatabase.* TO 'rel-fagr'@'%';
    FLUSH PRIVILEGES;
EOSQL

# # Stop the MariaDB service
# /etc/init.d/mysql stop
kill  $(cat /var/run/mysqld/mysqld.pid)

mysqld
