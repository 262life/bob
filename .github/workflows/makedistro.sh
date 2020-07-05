#!/bin/sh -x

sudo rm -rf distro/work 2>/dev/null
sudo mkdir distro/work
cd distro/work || exit
sudo tar zxf ../ubuntu-focal-core-cloudimg-amd64-root.tar.gz 

#-----  bootstrap  and mini distro
sudo find usr/bin \( -type f -o -type l \) \( -name "*" ! -name "\["  ! -name "dash" ! -name "ls" ! -name "sleep" \) -delete
sudo find . -empty -type d -delete
sudo find etc/*  \( -name "*" ! -name "\[" ! -name "passwd" ! -name "nsswitch" \) -delete 
sudo mv usr/bin/dash usr/bin/sh
sudo rm -rf usr/share usr/lib/x86_64-linux-gnu/gconv usr/lib/x86_64-linux-gnu/perl-base usr/lib/x86_64-linux-gnu/e2fsprogs usr/lib/x86_64-linux-gnu/audit usr/lib/x86_64-linux-gnu/security etc/systemd usr/lib/terminfo usr/lib/apt usr/lib/lsb usr/lib/systemd usr/lib/locale usr/local  usr/lib/udev usr/sbin 2>/dev/null
#--------

sudo rm usr/lib/x86_64-linux-gnu/libprocps.so.8
sudo rm usr/lib/x86_64-linux-gnu/libseccomp.so.2
sudo rm usr/lib/x86_64-linux-gnu/libext2fs.so.2
sudo rm usr/lib/x86_64-linux-gnu/libblkid.so.1
sudo rm usr/lib/x86_64-linux-gnu/libgcrypt.so.20.2.5
sudo rm usr/lib/x86_64-linux-gnu/libcom_err.so.2
sudo rm usr/lib/x86_64-linux-gnu/libudev.so.1
sudo rm usr/lib/x86_64-linux-gnu/libpcre.so.3
sudo rm usr/lib/x86_64-linux-gnu/libhogweed.so.5
sudo rm usr/lib/x86_64-linux-gnu/libmenuw.so.6
sudo rm usr/lib/x86_64-linux-gnu/libpanel.so.6
sudo rm usr/lib/x86_64-linux-gnu/libpam.so.0
sudo rm usr/lib/x86_64-linux-gnu/libzstd.so.1.4.4
sudo rm usr/lib/x86_64-linux-gnu/libcom_err.so.2.1
sudo rm usr/lib/x86_64-linux-gnu/libpcre.so.3.13.3
sudo rm usr/lib/x86_64-linux-gnu/librt-2.31.so
sudo rm usr/lib/x86_64-linux-gnu/libcap-ng.so.0
sudo rm usr/lib/x86_64-linux-gnu/libattr.so.1
sudo rm usr/lib/x86_64-linux-gnu/libnettle.so.7
sudo rm usr/lib/x86_64-linux-gnu/libtinfo.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/libmount.so.1
sudo rm usr/lib/x86_64-linux-gnu/libhogweed.so.5.0
sudo rm usr/lib/x86_64-linux-gnu/libss.so.2.0
sudo rm usr/lib/x86_64-linux-gnu/libmount.so.1.1.0
sudo rm usr/lib/x86_64-linux-gnu/libfdisk.so.1.1.0
sudo rm usr/lib/x86_64-linux-gnu/libmenu.so.6
sudo rm usr/lib/x86_64-linux-gnu/libtic.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/liblzma.so.5
sudo rm usr/lib/x86_64-linux-gnu/libacl.so.1.1.2253
sudo rm usr/lib/x86_64-linux-gnu/libpam_misc.so.0.82.1
sudo rm usr/lib/x86_64-linux-gnu/libgcrypt.so.20
sudo rm usr/lib/x86_64-linux-gnu/libncurses.so.6
sudo rm usr/lib/x86_64-linux-gnu/libform.so.6
sudo rm usr/lib/x86_64-linux-gnu/libapt-pkg.so.6.0.0
sudo rm usr/lib/x86_64-linux-gnu/libpcreposix.so.3.13.3
sudo rm usr/lib/x86_64-linux-gnu/libsystemd.so.0.28.0
sudo rm usr/lib/x86_64-linux-gnu/libncursesw.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/libncursesw.so.6
sudo rm usr/lib/x86_64-linux-gnu/libpamc.so.0.82.1
sudo rm usr/lib/x86_64-linux-gnu/libblkid.so.1.1.0
sudo rm usr/lib/x86_64-linux-gnu/libp11-kit.so.0
sudo rm usr/lib/x86_64-linux-gnu/libBrokenLocale-2.31.so
sudo rm usr/lib/x86_64-linux-gnu/libgmp.so.10.4.0
sudo rm usr/lib/x86_64-linux-gnu/libaudit.so.1
sudo rm usr/lib/x86_64-linux-gnu/libtinfo.so.6
sudo rm usr/lib/x86_64-linux-gnu/libidn2.so.0.3.6
sudo rm usr/lib/x86_64-linux-gnu/libmemusage.so
sudo rm usr/lib/x86_64-linux-gnu/libe2p.so.2
sudo rm usr/lib/x86_64-linux-gnu/libcap-ng.so.0.0.0
sudo rm usr/lib/x86_64-linux-gnu/libuuid.so.1
sudo rm usr/lib/x86_64-linux-gnu/libthread_db-1.0.so
sudo rm usr/lib/x86_64-linux-gnu/libgnutls.so.30
sudo rm usr/lib/x86_64-linux-gnu/libgcc_s.so.1
sudo rm usr/lib/x86_64-linux-gnu/libss.so.2
sudo rm usr/lib/x86_64-linux-gnu/libformw.so.6
sudo rm usr/lib/x86_64-linux-gnu/libfdisk.so.1
sudo rm usr/lib/x86_64-linux-gnu/libe2p.so.2.3
sudo rm usr/lib/x86_64-linux-gnu/libtic.so.6
sudo rm usr/lib/x86_64-linux-gnu/libanl.so.1
sudo rm usr/lib/x86_64-linux-gnu/libbz2.so.1.0.4
sudo rm usr/lib/x86_64-linux-gnu/libbz2.so.1.0
sudo rm usr/lib/x86_64-linux-gnu/libattr.so.1.1.2448
sudo rm usr/lib/x86_64-linux-gnu/libformw.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/libpam.so.0.84.2
sudo rm usr/lib/x86_64-linux-gnu/libpanel.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/libnettle.so.7.0
sudo rm usr/lib/x86_64-linux-gnu/libsemanage.so.1
sudo rm usr/lib/x86_64-linux-gnu/libpcreposix.so.3
sudo rm usr/lib/x86_64-linux-gnu/libmvec.so.1
sudo rm usr/lib/x86_64-linux-gnu/libmenu.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/libcrypt.so.1
sudo rm usr/lib/x86_64-linux-gnu/libm.so.6
sudo rm usr/lib/x86_64-linux-gnu/libmvec-2.31.so
sudo rm usr/lib/x86_64-linux-gnu/libmenuw.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/libunistring.so.2.1.0
sudo rm usr/lib/x86_64-linux-gnu/libtasn1.so.6.6.0
sudo rm usr/lib/x86_64-linux-gnu/libseccomp.so.2.4.3
sudo rm usr/lib/x86_64-linux-gnu/libdebconfclient.so.0
sudo rm usr/lib/x86_64-linux-gnu/libncurses.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/liblzma.so.5.2.4
sudo rm usr/lib/x86_64-linux-gnu/libzstd.so.1
sudo rm usr/lib/x86_64-linux-gnu/libgmp.so.10
sudo rm usr/lib/x86_64-linux-gnu/liblz4.so.1
sudo rm usr/lib/x86_64-linux-gnu/libuuid.so.1.3.0
sudo rm usr/lib/x86_64-linux-gnu/libudev.so.1.6.17
sudo rm usr/lib/x86_64-linux-gnu/liblz4.so.1.9.2
sudo rm usr/lib/x86_64-linux-gnu/libthread_db.so.1
sudo rm usr/lib/x86_64-linux-gnu/libform.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/libaudit.so.1.0.0
sudo rm usr/lib/x86_64-linux-gnu/libpanelw.so.6.2
sudo rm usr/lib/x86_64-linux-gnu/librt.so.1
sudo rm usr/lib/x86_64-linux-gnu/libdb-5.3.so
sudo rm usr/lib/x86_64-linux-gnu/libffi.so.7
sudo rm usr/lib/x86_64-linux-gnu/libpanelw.so.6
sudo rm usr/lib/x86_64-linux-gnu/libapt-private.so.0.0.0
sudo rm usr/lib/x86_64-linux-gnu/libidn2.so.0
sudo rm usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.9.0
sudo rm usr/lib/x86_64-linux-gnu/libbz2.so.1
sudo rm usr/lib/x86_64-linux-gnu/libcrypt.so.1.1.0
sudo rm usr/lib/x86_64-linux-gnu/libz.so.1.2.11
sudo rm usr/lib/x86_64-linux-gnu/libsystemd.so.0
sudo rm usr/lib/x86_64-linux-gnu/libgpg-error.so.0
sudo rm usr/lib/x86_64-linux-gnu/libpamc.so.0
sudo rm usr/lib/x86_64-linux-gnu/libpam_misc.so.0
sudo rm usr/lib/x86_64-linux-gnu/libext2fs.so.2.4
sudo rm usr/lib/x86_64-linux-gnu/libm-2.31.so
sudo rm usr/lib/x86_64-linux-gnu/libapt-pkg.so.6.0
sudo rm usr/lib/x86_64-linux-gnu/libacl.so.1

sudo rm usr/lib/x86_64-linux-gnu/libpcre2-8.so.0
sudo rm usr/lib/x86_64-linux-gnu/libtasn1.so.6
sudo rm usr/lib/x86_64-linux-gnu/libdebconfclient.so.0.0.0
sudo rm usr/lib/x86_64-linux-gnu/libsepol.so.1
sudo rm usr/lib/x86_64-linux-gnu/libsmartcols.so.1
sudo rm usr/lib/x86_64-linux-gnu/libBrokenLocale.so.1
sudo rm usr/lib/x86_64-linux-gnu/libunistring.so.2
sudo rm usr/lib/x86_64-linux-gnu/libffi.so.7.1.0
sudo rm usr/lib/x86_64-linux-gnu/libsmartcols.so.1.1.0
sudo rm usr/lib/x86_64-linux-gnu/libp11-kit.so.0.3.0
sudo rm usr/lib/x86_64-linux-gnu/libapt-private.so.0.0
sudo rm usr/lib/x86_64-linux-gnu/libpcprofile.so
sudo rm usr/lib/x86_64-linux-gnu/libanl-2.31.so
sudo rm usr/lib/x86_64-linux-gnu/libgpg-error.so.0.28.0
sudo rm usr/lib/x86_64-linux-gnu/coreutils/libstdbuf.so



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


