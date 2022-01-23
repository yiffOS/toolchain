#! /bin/bash

echo "########"
echo "Building: libstdc++"
echo "########"
echo "Mount: $1"
echo "Target: $2"
echo "Source: $3"
echo "Makeflags: $4"
echo "########"


cd $3
mkdir -v build
cd build

../libstdc++-v3/configure           \
    --host=$2                       \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$2/include/c++/11.2.0


make $4
make DESTDIR=$1 install
