#!/bin/sh 

sudo rm -rf distro/work 2>/dev/null
sudo mkdir distro/work
cd distro/work || exit
sudo tar zxf ../ubuntu-focal-core-cloudimg-amd64-root.tar.gz 

#-----  bootstrap  and mini distro
sudo find usr/bin \( -type f -o -type l \) \( -name "*" ! -name "\["  ! -name "dash" ! -name "ls" ! -name "sleep" \) -delete
sudo find . -empty -type d -delete
sudo rm -rf etc/pam.d
sudo find etc/*  \( -name "*" ! -name "\[" ! -name "passwd" ! -name "nsswitch" \) -delete 


sudo mv usr/bin/dash usr/bin/sh
sudo rm -rf usr/share usr/lib/x86_64-linux-gnu/gconv usr/lib/x86_64-linux-gnu/perl-base usr/lib/x86_64-linux-gnu/e2fsprogs usr/lib/x86_64-linux-gnu/audit usr/lib/x86_64-linux-gnu/security etc/systemd usr/lib/terminfo usr/lib/apt usr/lib/lsb usr/lib/systemd usr/lib/locale usr/local  usr/lib/udev usr/sbin 2>/dev/null
#--------  Remove Libs

sudo ldd  bin/* usr/bin/* \
       | sed -e "s/(.*)//g" -e "s/^[ \t]*//g" \
       | grep -v "^.*:" \
       | sort -u > /tmp/ldd.db.raw

# Save loader
sudo find /usr -name "ld*.so*" >> /tmp/ldd.raw

grep "=" /tmp/ldd.db.raw | awk -F\=\> '{print $2}' > /tmp/ldd.db
grep "^\/" /tmp/ldd.db.raw  >> /tmp/ldd.db
mv /tmp/ldd.db /tmp/ldd.db.raw2

grep -v not  /tmp/ldd.db.raw2 |
while read r
do
basename "$r" >> /tmp/ldd.db
done

sudo find .  -name "*.so*" -type f   $(printf "! -name %s " $(cat /tmp/ldd.db) )   -delete
sudo rm -rf  var/lib/dpkg var/log/dpkg*


#----- Sidecar distro
sudo rm -rf var/cache/debconf/templates.dat
sudo tar --exclude usr -zcf ../squashed.tar.gz ./*

##------
sudo cp ../socat usr/bin/socat && sudo chown root:root usr/bin/socat && sudo chmod 755 usr/bin/socat
sudo cp ../rsync usr/bin/rsync && sudo chown root:root usr/bin/rsync && sudo chmod 755 usr/bin/rsync
sudo cp -R ../x86_64-linux-gnu/*  usr/lib/x86_64-linux-gnu/. && sudo chown root:root usr/lib/x86_64-linux-gnu/*  && sudo chmod 755 usr/lib/x86_64-linux-gnu/*
sudo tar --exclude var -zcf ../squashed-bootstrap.tar.gz ./*

##-----

cd ../..
sudo rm -rf distro/work


