#!/bin/bash

# # Install Mariadb and dependencies
# apt-get update && apt-get install -y mariadb-server mariadb-client 

# # Create a data directory
# mkdir -p /var/lib/mysql

# # Set ownership and permissions
# chown -R mysql:mysql /var/lib/mysql
# chmod 777 /var/lib/mysql

# exec "$@"

# -----------------------------------------------------

/etc/init.d/mysql start

# Execute your custom initialization commands here
# For example, create a new database and user
mysql -u root <<EOSQL
    CREATE DATABASE mydatabase;
    CREATE USER 'rel-fagr'@'%' IDENTIFIED BY '123456789';
    GRANT ALL PRIVILEGES ON mydatabase.* TO 'rel-fagr'@'%';
    FLUSH PRIVILEGES;
EOSQL

# # Stop the MariaDB service
/etc/init.d/mysql stop

# Start MariaDB again in normal mode
exec "$@"
