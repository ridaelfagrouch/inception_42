#!/bin/bash

/etc/init.d/mysql start

# Set the bind address to 0.0.0.0 to allow connections from all IP addresses
sed -i "s/bind-address.*/bind-address = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# For example, create a new database if not exist and user
mysql -u root <<EOSQL
    CREATE DATABASE $DB_NAME;
    CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
    GRANT ALL PRIVILEGES ON mydatabase.* TO '$DB_USER'@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
    FLUSH PRIVILEGES;
EOSQL

# # Stop the MariaDB service
kill  `cat /var/run/mysqld/mysqld.pid`

mysqld
