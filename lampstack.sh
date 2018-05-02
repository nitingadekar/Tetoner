#!/bin/bash

echo "Installing LampStack"
sudo yum update –y
sudo yum install -y gcc make gcc-c++
sudo yum install -y php56-mysqlnd php56-gd php56 php56-xml php56-mcrypt php56-mbstring php56-cli mysql56 mysql56-server httpd24
sudo service httpd start
sudo chkconfig httpd on
chkconfig --list httpd
sudo groupadd www
sudo usermod -a -G www ec2-user
sudo usermod -a -G www apache
sudo chown -R root:www /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} +
find /var/www -type f -exec sudo chmod 0664 {} +
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

sudo service mysqld start

#sudo mysql_secure_installation
#echo -e "root\nn\nY\nY\nY\nY\n"| sudo mysql_secure_installation
echo -e "\nY\nx7AQtXAt27\nx7AQtXAt27\nY\nY\nY\nY\n" | mysql_secure_installation

sudo service mysqld stop

sudo chkconfig mysqld on
sudo usermod -a -G www apache
sudo chgrp -R www /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} +
find /var/www -type f -exec sudo chmod 0664 {} +

sudo service httpd restart
sudo service mysqld start

sudo yum --enablerepo=epel install phpmyadmin -y

sed -i '27 a\Options All \n AllowOverride All \n Require all granted' /etc/httpd/conf.d/phpMyAdmin.conf
sudo service httpd restart
sudo service mysqld start
