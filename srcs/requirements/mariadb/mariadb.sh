#!/bin/bash

# Install Mariadb
apk add --no-cache mariadb mariadb-client

# Create a data directory
mkdir -p /var/lib/mysql

# Set ownership and permissions
chown -R mysql:mysql /var/lib/mysql
chmod 777 /var/lib/mysql