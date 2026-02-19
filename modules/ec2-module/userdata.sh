#!/bin/bash
dnf update -y

# Install Apache
dnf install httpd -y
systemctl start httpd
systemctl enable httpd

# Install PHP
dnf install php php-mysqlnd php-fpm -y

# Install MariaDB
dnf install mariadb105-server -y
systemctl start mariadb
systemctl enable mariadb

# Create WordPress DB
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Install WordPress
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
chown -R apache:apache wordpress
chmod -R 755 wordpress

systemctl restart httpd
