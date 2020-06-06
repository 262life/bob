#!/bin/sh -eu

chown root:root /root/.bashrc && chmod 700 /root/.bashrc && chown root:root /etc/ganesha/ganesha.conf && chmod 700 /etc/ganesha/ganesha.conf
mkdir -p /var/run/dbus
/usr/bin/iperf3 --server --daemon --logfile /var/log/iperf3.txt --pidfile /var/run/iperf3.pid
mkdir /data
mount -t tmpfs -o size=1G sparramdisk /data
cp -r /usr /data
mount -oremount,ro /data
service ssh start 
systemctl start rpcbind
systemctl start nfs-ganesha

exec bash -c "while [ 1==1 ]; do sleep 120;done"

