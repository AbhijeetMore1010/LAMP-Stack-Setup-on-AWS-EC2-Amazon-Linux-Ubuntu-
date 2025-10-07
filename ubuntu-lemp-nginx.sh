#!/bin/bash
# LEMP Stack Setup Script for Ubuntu 22.04+
# Nginx + MariaDB + PHP-FPM


# Update package list
sudo apt update -y
sudo apt upgrade -y

# Install Nginx web server
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Install MariaDB Server
sudo apt install -y mariadb-server
sudo systemctl enable mariadb
sudo systemctl start mariadb

# Install PHP-FPM and extensions
sudo apt install -y php-fpm php-mysql php-json php-gd php-xml php-mbstring php-curl

# Configure Nginx to use PHP processor
sudo tee /etc/nginx/sites-available/default > /dev/null <<EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.php index.html index.htm;
    server_name _;
    location / {
        try_files \$uri \$uri/ =404;
    }
    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php-fpm.sock;
    }
    location ~ /\.ht {
        deny all;
    }
}
EOF

# Restart PHP-FPM and Nginx
sudo systemctl restart php-fpm
sudo systemctl restart nginx

# Display versions
echo "Nginx Version:"
nginx -v
echo "MariaDB Version:"
mysql --version
echo "PHP Version:"
php -v

echo "✅ LEMP stack installation completed on Ubuntu."
echo "Web Root: /var/www/html"
echo "Nginx Port: 80"
echo "MariaDB Port: 3306"
