#!/bin/bash
# LEMP Stack Setup Script for Amazon Linux 2
# Nginx + MariaDB + PHP-FPM


# Update system packages
sudo yum update -y

# Install Nginx
sudo amazon-linux-extras install -y nginx1
sudo systemctl enable nginx
sudo systemctl start nginx

# Install MariaDB Server
sudo yum install -y mariadb105-server
sudo systemctl enable mariadb
sudo systemctl start mariadb

# Install PHP-FPM and extensions
sudo yum install -y php php-fpm php-mysqlnd php-json php-gd php-xml php-mbstring php-curl

# Enable and start PHP-FPM
sudo systemctl enable php-fpm
sudo systemctl start php-fpm

# Adjust PHP-FPM user to nginx
sudo sed -i 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
sudo sed -i 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf

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

echo "✅ LEMP stack installation completed on Amazon Linux 2."
echo "Web Root: /usr/share/nginx/html"
echo "Nginx Port: 80"
echo "MariaDB Port: 3306"
