#!/bin/bash
# LAMP Stack Setup Script for Ubuntu 22.04+
# Apache + MariaDB + PHP


# Update package list
sudo apt update -y
sudo apt upgrade -y

# Install Apache web server
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

# Install MariaDB Server
sudo apt install -y mariadb-server
sudo systemctl enable mariadb
sudo systemctl start mariadb

# Install PHP and extensions
sudo apt install -y php libapache2-mod-php php-mysql php-json php-gd php-xml php-mbstring php-curl

# Restart Apache
sudo systemctl restart apache2

# Display versions
echo "Apache Version:"
apache2 -v
echo "MariaDB Version:"
mysql --version
echo "PHP Version:"
php -v

echo "✅ LAMP stack installation completed on Ubuntu."
echo "Web Root: /var/www/html"
echo "Apache Port: 80"
echo "MariaDB Port: 3306"
