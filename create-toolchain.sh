#! /bin/bash

echo "########"
echo "Now building the yiffOS toolchain"
echo "########"
echo "Mount: $1"
echo "Target: $2"
echo "Source: $3"
echo "Makeflags: $4"
echo "########"
./binutils.sh $1 $2 $3 $4
./gcc.sh $1 $2 $3 $4
./linux-headers.sh $1 $2 $3 $4
./glibc.sh $1 $2 $3 $4
./libstdcxx.sh $1 $2 $3 $4
./openssl.sh $1 $2 $3 $4
./cmake.sh $1 $2 $3 $4
./clang.sh $1 $2 $3 $4