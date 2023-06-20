#!/bin/bash

cat > /etc/nginx/sites-available/default << EOF
server {
    listen 3001;
    listen [::]:3001;

    server_name ${DOMAIN_NAME};

    index index.html index.htm;

    root /var/www/html/websiteFiles;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Start Nginx
nginx -g 'daemon off;'

