#!/bin/bash
MACHINE_NAME=$1
echo "Provisioning ${MACHINE_NAME}"
echo "Creating group and initializing lxd";
sudo snap install lxd --channel=4.0/stable ;
newgrp lxd;
cat /vagrant/config/preseeds/${MACHINE_NAME}.YAML | sudo lxd init --preseed
sleep 10

echo "Exporting certificate"
sed ':a;N;$!ba;s/\n/\n    /g;s/^/    /g' /var/snap/lxd/common/lxd/server.crt > /vagrant/config/certificate/cluster_certificate.txt

