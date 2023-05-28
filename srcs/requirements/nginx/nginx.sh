#!/bin/bash

# Set domain name
DOMAIN_NAME=localhost

# Generate self-signed SSL certificate
# echo "Generating self-signed SSL certificate for ${DOMAIN_NAME}..."
# mkdir /etc/nginx/ssl

# Generate private key
# echo "Generating private key..."
# openssl genrsa -out /etc/nginx/ssl/nginx.key 2048

# Generate certificate signing request
# openssl req -new -key /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.csr -subj "/C=US/ST=CA/L=San Francisco/O=My Company/CN=${DOMAIN_NAME}"

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/test.key -out /etc/nginx/ssl/test.crt -subj "/C=US/ST=CA/L=San Francisco/O=My Company/CN=${DOMAIN_NAME}"

# Create Nginx configuration file
cat > /etc/nginx/conf.d/default.conf << EOF
server {
    listen 80;
    listen [::]:80;
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name ${DOMAIN_NAME};

    ssl_certificate /etc/nginx/ssl/test.crt;
    ssl_certificate_key /etc/nginx/ssl/test.key;

    root /var/www/html;
    location / {
        index index.html;
    }

    location ~ .php {
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
        }
}
EOF

# Start Nginx
nginx -g 'daemon off;'
