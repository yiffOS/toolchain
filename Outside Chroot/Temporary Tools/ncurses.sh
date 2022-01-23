#! /bin/bash

echo "=> Building: ncurses"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"

###############################################################################

cd $3

# Ensure gawk is found first during configuration
sed -i s/mawk// configure

# Build the tic program
mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=/usr                \
            --host=$2                    \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-debug              \
            --without-ada                \
            --without-normal             \
            --disable-stripping          \
            --enable-widec

make $4
make DESTDIR=$1 TIC_PATH=$(pwd)/build/progs/tic install
echo "INPUT(-lncursesw)" > $1/usr/lib/libncurses.so