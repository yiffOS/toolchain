#! /bin/bash

target=$(uname -m)-yiffos-linux-gnu

echo "########"
echo "Now building the yiffOS toolchain"
echo "########"
echo "Mount: $1"
echo "Target: $target"
echo "Source: $2"
echo "Makeflags: $3"
./binutils.sh $1 $target $2/binutils $3
./gcc.sh $1 $target $2/gcc $3
./linux-headers.sh $1 $target $2/linux $3
./glibc.sh $1 $target $2/glibc $3
./libstdcxx.sh $1 $target $2/gcc $3
./openssl.sh $1 $target $2/openssl $3
./cmake.sh $1 $target $2/cmake $3
./clang.sh $1 $target $2/llvm $3