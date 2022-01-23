#! /bin/bash

echo "=> Building: binutils (pass 1)"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"


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