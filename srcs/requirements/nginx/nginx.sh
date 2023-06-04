#!/bin/bash

# Set domain name
DOMAIN_NAME=localhost

cat > /etc/nginx/sites-available/default << EOF
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name ${DOMAIN_NAME};

    ssl_certificate /etc/nginx/ssl/test.crt;
    ssl_certificate_key /etc/nginx/ssl/test.key;
    
    ssl_protocols TLSv1.3;

    index index.php index.html index.htm;

    root /var/www/html;

        location ~ [^/]\\.php(/|$) {
        try_files "\$uri" =404;
        fastcgi_pass wordpress:9000;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }
}
EOF

# Start Nginx
nginx -g 'daemon off;'

