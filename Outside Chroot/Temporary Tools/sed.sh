#! /bin/bash

echo "=> Building: sed"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"

###############################################################################

cd $3

./configure --prefix=/usr   \
            --host=$2

make $4
make DESTDIR=$1 install