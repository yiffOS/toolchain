#! /bin/bash

# OpenSSL can be compiled with clang
export CC=clang 
export CXX=clang++

echo "########"
echo "Building: openssl"
echo "########"
echo "Mount: $1"
echo "Target: $2"
echo "Source: $3"
echo "Makeflags: $4"
echo "########"


cd $3
mkdir -v build
cd build

../config --prefix=$1/tools             \
          --openssldir=$1/tools/etc/ssl \
          --libdir=lib

make $4
make MANSUFFIX=ssl install