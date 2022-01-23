#! /bin/bash

echo "=> Building: patch"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"

###############################################################################

cd $3

./configure --prefix=/usr   \
            --host=$2       \
            --build=$(build-aux/config.guess)

make $4
make DESTDIR=$1 install