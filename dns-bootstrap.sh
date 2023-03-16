#!/usr/bin/env bash


# DNS Persistance.
apt update
apt install resolvconf -y

systemctl start resolvconf.service
systemctl enable resolvconf.service
systemctl status resolvconf.service


echo "nameserver 192.168.9.200" >> /etc/resolvconf/resolv.conf.d/head
echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/head


systemctl stop resolvconf.service
systemctl start resolvconf.service

echo "DNS Configuration done"
host `uname -n`
