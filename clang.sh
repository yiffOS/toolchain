#! /bin/bash

# clang can be compiled with clang
export CC=clang 
export CXX=clang++

echo "########"
echo "Building: clang"
echo "########"
echo "Mount: $1"
echo "Target: $2"
echo "Source: $3"
echo "Makeflags: $4"
echo "########"


cd $3
mkdir -v build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$1/tools  \
      -DCMAKE_BUILD_TYPE=Release       \
      -DLLVM_TARGETS_TO_BUILD="host"   \
      -Wno-dev ..

make $4
make install