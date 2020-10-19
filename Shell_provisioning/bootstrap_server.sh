#!/bin/bash
echo "configurando el resolv.conf con cat"
sudo -i
cat <<TEST> /etc/resolv.conf
nameserver 8.8.8.8
TEST
echo "instalando un servidor vsftpd"
apt-get install vsftpd -y
echo “Modificando vsftpd.conf con sed”
sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf
sed -i 's/anonymous_enable=NO/anonymous_enable=YES/g' /etc/vsftpd.conf
echo "configurando ip forwarding con echo"
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
systemctl reload vsftpd
echo "END"