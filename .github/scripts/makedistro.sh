#!/bin/sh 

cd distro || exit

if [ ! -f ubuntu-focal-latest.tar.gz ];then
  cat ubuntu-focal-latest-* > ubuntu-focal-latest.tar.gz
fi

cd .. || exit

sudo rm -rf distro/work 2>/dev/null
sudo mkdir distro/work
cd distro/work || exit

sudo tar zxf ../ubuntu-focal-latest.tar.gz 

#-----  lowcarb  and mini distro
sudo find usr/bin \( -type f -o -type l \) \( -name "*" ! -name "\["  ! -name "dash" ! -name "ls" ! -name "sleep" ! -name "rsync" ! -name "socat" \) -delete
sudo find . -empty -type d -delete
sudo rm -rf etc/pam.d
sudo find etc/*  \( -name "*" ! -name "\[" ! -name "passwd" ! -name "nsswitch" ! -name "ld.so.cache" \) -delete 


sudo mv usr/bin/dash usr/bin/sh
sudo rm -rf usr/share usr/lib/x86_64-linux-gnu/gconv usr/lib/x86_64-linux-gnu/perl-base usr/lib/x86_64-linux-gnu/e2fsprogs usr/lib/x86_64-linux-gnu/audit usr/lib/x86_64-linux-gnu/security etc/systemd usr/lib/terminfo usr/lib/apt usr/lib/lsb usr/lib/systemd usr/lib/locale usr/local  usr/lib/python* usr/lib/udev usr/sbin work 2>/dev/null

#--------  Remove Libs

sudo ldd  bin/* usr/bin/* \
       | sed -e "s/(.*)//g" -e "s/^[ \t]*//g" \
       | grep -v "^.*:" \
       | sort -u > /tmp/ldd.db.raw

grep "=" /tmp/ldd.db.raw | awk -F=\> '{print $2}' > /tmp/ldd.db
grep "^\/" /tmp/ldd.db.raw  >> /tmp/ldd.db
mv /tmp/ldd.db /tmp/ldd.db.raw2

# Save loader
ld_ver=$(sudo basename $(find usr/lib -name "ld-*.so") | sed -e "s/ld-//g" -e "s/\.so//g")
find usr/lib -name "*${ld_ver}*" >> /tmp/ldd.db.raw2

grep -v not  /tmp/ldd.db.raw2 |
while read -r r
do
  basename "$r*" >> /tmp/ldd.db
done

echo "---------------------"
echo "Raw Database..."
echo "---------------------"
cat /tmp/ldd.db.raw
echo "---------------------"
echo "ldd database..."
echo "---------------------"
cat /tmp/ldd.db

sudo find .  -name "*.so*" -type f   $(printf "! -name %s " $(cat /tmp/ldd.db) )   -delete
sudo find usr/lib  -type l ! -exec test -e {} \; -delete

sudo rm -rf  lib/x86_64-linux-gnu/security
sudo rm -rf  var/lib/dpkg var/log/dpkg*
sudo find var/log -type f -delete


sudo tar --exclude var -zcvf ../squashed-lowcarb.tar.gz ./*

##-----

cd ../.. || exit
sudo rm -rf distro/work
cd distro || exit
sudo rm -f ubuntu-local-latest-*
split -b 20000000 ubuntu-focal-latest.tar.gz ubuntu-focal-latest-
cd .. || exit
sudo rm -f distro/ubuntu-focal-latest.tar.gz

