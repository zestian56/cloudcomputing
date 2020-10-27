#!/bin/bash
CONTAINER_NAME=$1
MACHINE_NAME=$2
echo "Provisioning ${MACHINE_NAME}"
newgrp lxd;

echo "Creating lxc"
sudo lxc launch ubuntu:18.04 ${CONTAINER_NAME} --target loadBalancer;
sleep 20

echo "Updating repos";
lxc exec ${CONTAINER_NAME} -- apt-get update;
lxc exec ${CONTAINER_NAME} -- apt-get upgrade -y;

echo "Installing haproxy";
lxc exec ${CONTAINER_NAME} -- apt install haproxy -y;
lxc file push /vagrant/config/haproxy.cfg ${CONTAINER_NAME}/etc/haproxy/haproxy.cfg ;
lxc file push /vagrant/config/html/503.html ${CONTAINER_NAME}/etc/haproxy/errors/503.http ;
lxc exec ${CONTAINER_NAME} -- systemctl enable haproxy;

echo "Restarting service";
lxc exec ${CONTAINER_NAME} -- systemctl restart haproxy;

echo "Port forward";
lxc config device add ${CONTAINER_NAME} http proxy listen=tcp:0.0.0.0:80 connect=tcp:127.0.0.1:80;