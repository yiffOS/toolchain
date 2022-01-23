#! /bin/bash

echo "=> Building: coreutils"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"

###############################################################################

cd $3

./configure --prefix=/usr                     \
            --host=$2                         \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime

make $4
make DESTDIR=$1 install

mv -v $1/usr/bin/chroot              $1/usr/sbin
mkdir -pv $1/usr/share/man/man8
mv -v $1/usr/share/man/man1/chroot.1 $1/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                    $1/usr/share/man/man8/chroot.8