#! /bin/bash

echo "=> Building: gawk"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"

###############################################################################

cd $3

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$2       \
            --build=$(build-aux/config.guess)

make $4
make DESTDIR=$1 install