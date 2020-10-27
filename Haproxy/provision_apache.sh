#!/bin/bash
echo "------ Update repos"
sudo -i
apt-get update;
apt-get upgrade -y;
apt install apache2 -y;

echo "------ Add index.html"
cp /vagrant/config/html/index.html /var/www/html/

echo "------ Restart apache"
systemctl enable apache2;
systemctl restart apache2;