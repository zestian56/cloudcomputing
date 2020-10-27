#!/bin/bash
CONTAINER_NAME=$1
MACHINE_NAME=$2
echo "Provisioning ${CONTAINER_NAME}"
newgrp lxd;

echo "Creating lxc "
sudo lxc launch ubuntu:18.04 ${CONTAINER_NAME} --target ${MACHINE_NAME};
sleep 20

echo "Updating repos";
lxc exec ${CONTAINER_NAME} -- apt-get update -y;

echo "Installing apache";
lxc exec ${CONTAINER_NAME} -- apt-get install apache2 -y;
lxc file push /vagrant/config/html/index.html ${CONTAINER_NAME}/var/www/html/index.html
lxc exec ${CONTAINER_NAME} -- systemctl enable apache2;

echo "Restarting service";
lxc exec ${CONTAINER_NAME} -- systemctl restart apache2;
