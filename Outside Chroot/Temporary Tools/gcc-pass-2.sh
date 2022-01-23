#! /bin/bash

echo "=> Building: gcc (pass 2)"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"

###############################################################################

cd $3

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

# Delete build folder from pass 1
rm -r build

mkdir -v build
cd build

mkdir -pv $2/libgcc
ln -s ../../../libgcc/gthr-posix.h $2/libgcc/gthr-default.h

../configure                                       \
    --build=$(../config.guess)                     \
    --host=$2                                      \
    --prefix=/usr                                  \
    CC_FOR_TARGET=$2-gcc                           \
    --with-build-sysroot=$1                        \
    --enable-initfini-array                        \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++

make $4
make install

ln -sv gcc $1/usr/bin/cc