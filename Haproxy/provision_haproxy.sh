#!/bin/bash

echo "-------- Updating repos";
apt-get update;
apt-get upgrade -y;

echo "-------- Installing haproxy";
apt install haproxy -y;
sudo cp /vagrant/config/haproxy.cfg /etc/haproxy/haproxy.cfg 
systemctl enable haproxy;

echo "-------- Restarting service";
systemctl restart haproxy;


