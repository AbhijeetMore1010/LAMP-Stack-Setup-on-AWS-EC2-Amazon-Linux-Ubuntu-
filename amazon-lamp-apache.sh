#!/bin/bash
# LAMP Stack Setup Script for Amazon Linux
# Apache + MariaDB + PHP


# Update system packages
sudo yum update -y

# Install Apache web server
sudo yum install -y httpd

# Enable and start Apache service
sudo systemctl enable httpd
sudo systemctl start httpd

# Install MariaDB Server
sudo yum install -y mariadb105-server
sudo systemctl enable mariadb
sudo systemctl start mariadb

# Install PHP and necessary extensions
sudo yum install -y php php-mysqlnd php-json php-gd php-xml php-mbstring php-curl

# Restart Apache to apply PHP configuration
sudo systemctl restart httpd

# Display versions for verification
echo "Apache Version:"
httpd -v
echo "MariaDB Version:"
mysql --version
echo "PHP Version:"
php -v

echo "✅ LAMP stack installation completed on Amazon Linux 2."
echo "Web Root: /var/www/html"

