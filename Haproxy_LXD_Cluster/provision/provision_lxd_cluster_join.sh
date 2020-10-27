#!/bin/bash
MACHINE_NAME=$1
echo "Provisioning ${MACHINE_NAME}"
echo "Creating group and initializing lxd";
sudo snap install lxd --channel=4.0/stable ;
newgrp lxd;

echo "Editing preseed";
sed -n -i -e '/server_address: /r /vagrant/config/certificate/cluster_certificate.txt' -e 1x -e '2,${x;p}' -e '${x;p}' /vagrant/config/preseeds/${MACHINE_NAME}.YAML

echo "Initializing lxd"
cat /vagrant/config/preseeds/${MACHINE_NAME}.YAML | sudo lxd init --preseed
