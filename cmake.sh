#! /bin/bash

# CMake can be compiled with clang
export CC=clang 
export CXX=clang++

echo "########"
echo "Building: cmake"
echo "########"
echo "Mount: $1"
echo "Target: $2"
echo "Source: $3"
echo "Makeflags: $4"
echo "########"

sed -i '/CMAKE_USE_LIBUV 1/s/1/0/' CMakeLists.txt
sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake

cd $3
mkdir -v build
cd build

../bootstrap --prefix=$1/tools \
             --no-system-libs

make $4
make install