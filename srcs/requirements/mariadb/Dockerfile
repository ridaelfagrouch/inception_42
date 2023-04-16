FROM alpine


WORKDIR /etc/mysql

# Install Mariadb
RUN apk add --no-cache mariadb mariadb-client

# Create a data directory
RUN mkdir -p /var/lib/mysql

# Set ownership and permissions
RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod 777 /var/lib/mysql

# Copy the configuration file
COPY /conf/mariadb.cnf /etc/mysql/

# Expose the default port
EXPOSE 3306

# Start Mariadb
CMD ["mysqld"]