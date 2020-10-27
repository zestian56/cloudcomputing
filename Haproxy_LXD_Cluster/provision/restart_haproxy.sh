#!/bin/bash
CONTAINER_NAME=$1
echo "Restarting ${CONTAINER_NAME}"
newgrp lxd;
lxc exec ${CONTAINER_NAME} -- systemctl restart haproxy; true