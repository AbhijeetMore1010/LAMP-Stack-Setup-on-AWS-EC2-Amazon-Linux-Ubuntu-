# LAMP Stack Setup on AWS EC2 (Amazon Linux-, Ubuntu)
The LAMP stack is a group of open-source software used together to host dynamic websites and web applications. LAMP stands for Linux,  Apache, MariaDB/MySQL, and PHP.   This environment is one of the most commonly used setups for web hosting on AWS EC2.


# ⚙️ Installed Software Components

# 1. Apache HTTP Server

Purpose: Handles web traffic and serves HTML/PHP content.

- Service Name: `httpd` (Amazon Linux) / `apache2` (Ubuntu)

- Default Ports:
  - 80 (HTTP)
  - 443 (HTTPS)

Document Root Directory:

For Ubunto  - /var/www/html/
For Amazon  - 

Log Files:
  - Access Log: /var/log/httpd/access_log or /var/log/apache2/access.log

  - Error Log: /var/log/httpd/error_log or /var/log/apache2/error.log


## OR ##


# Nginx (Engine X):
- Purpose: High-performance web server and reverse proxy.
- Service Name: `nginx`

- Default Ports:
  - 80 (HTTP) → Used for regular website access.
  - 443 (HTTPS) → Used for SSL/TLS-secured connections.

- Configuration Files:
  - Main: `/etc/nginx/nginx.conf`
  - Site-specific: `/etc/nginx/conf.d/` or `/etc/nginx/sites-available/`

- Default Web Root Directory:
  - `/usr/share/nginx/html/` (Amazon Linux)
  - /var/www/html/ (Ubuntu)

- Log Files:
  - Access Log: `/var/log/nginx/access.log`
  - Error Log: `/var/log/nginx/error.log`


# 2. MariaDB Server (Version 10.5)

- Service Name: `mariadb` or `mysql`

- Default Port: 3306

- Configuration File: 
/etc/my.cnf` (Amazon Linux)
/etc/mysql/mariadb.conf.d/50-server.cnf` (Ubuntu)

- Data Directory: /var/lib/mysql/

- Use Case: Stores website content, user data, and application configurations .

# 3. PHP (Version 8.x)
- Purpose: Scripting language for building dynamic web applications.

- Default Directory for PHP Files: `/var/www/html/`
- Configuration File: 
/etc/php.ini (Amazon Linux)
/etc/php/8.x/apache2/php.ini (Ubuntu)

- Common PHP Extensions Installed:

  - `php-mysqlnd` → Enables PHP to communicate with MariaDB/MySQL.
  - `php-json` → Handles JSON data.
  - `php-gd` → For image processing.
  - `php-mbstring` → For multi-byte string support.
  - `php-curl` → For API integrations.
  - `php-xml` → For XML parsing and web services.
- PHP Info Test File: Commonly accessed via `info.php` to verify PHP configuration..

# 4. Security & Network Configuration

- Inbound Security Group Rules:
  - Port 22 (SSH): For secure terminal access.
  - Port 80 (HTTP): For serving web traffic.
  - Port 443 (HTTPS): For SSL-encrypted access.
  - Port 3306 (MySQL/MariaDB): Usually restricted to internal access only.

# For Amazon linux LAMP+Apache Server USE
amazon-linux-lamp.sh

# 
