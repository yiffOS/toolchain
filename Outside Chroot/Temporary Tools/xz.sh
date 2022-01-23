#! /bin/bash

echo "=> Building: xz"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"

###############################################################################

cd $3

./configure --prefix=/usr                     \
            --host=$2                         \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.5

make $4
make DESTDIR=$1 install