#! /bin/bash

echo "=> Building: binutils (pass 2)"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"

###############################################################################

cd $3

# Delete build folder from pass 1
rm -r build

mkdir -v build
cd build

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$2                  \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd

make $4

make DESTDIR=$1 install -j1
install -vm755 libctf/.libs/libctf.so.0.0.0 $1/usr/lib