#! /bin/bash

# Binutils can be compiled with clang
export CC=clang 
export CXX=clang++

echo "########"
echo "Building: binutils"
echo "########"
echo "Mount: $1"
echo "Target: $2"
echo "Source: $3"
echo "Makeflags: $4"
echo "########"


cd $3
mkdir -v build
cd build

../configure --prefix=$1/tools          \
             --with-sysroot=$1          \
             --target=$2                \
             --disable-nls              \
             --disable-werror

make $4
make install