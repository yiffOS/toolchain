#! /bin/bash

echo "=> Building: bash"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"

###############################################################################

cd $3

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$2                       \
            --without-bash-malloc

make $4
make DESTDIR=$1 install

ln -sv bash $1/bin/sh