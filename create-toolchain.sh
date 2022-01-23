#! /bin/bash

target=$(uname -m)-yiffos-linux-gnu

echo "===> Building the yiffOS toolchain <==="
echo "> Mount: $1"
echo "> Target: $target"
echo "> Source: $2"
echo "> Makeflags: $3"

# Do stuff outside of chroot first
cd "Outside Chroot"

# Inital temporary toolchain
echo "==> Building Temporary Toolchain"

cd "Temporary Toolchain"
./binutils-pass-1.sh $1 $target $2/binutils $3
./gcc-pass-1.sh $1 $target $2/gcc $3
./linux-headers.sh $1 $target $2/linux $3
./glibc.sh $1 $target $2/glibc $3
./libstdcxx-pass-1.sh $1 $target $2/gcc $3
cd ..

# Temporary tools
echo "==> Building Temporary Tools"

cd "Temporary Tools" 
cd ..

# Chroot time!