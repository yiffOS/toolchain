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
./m4.sh $1 $target $2/m4 $3
./ncurses.sh $1 $target $2/ncurses $3
./bash.sh $1 $target $2/bash $3
./coreutils.sh $1 $target $2/coreutils $3
./diffutils.sh $1 $target $2/diffutils $3
./file.sh $1 $target $2/file $3
./findutils.sh $1 $target $2/findutils $3
./gawk.sh $1 $target $2/gawk $3
./grep.sh $1 $target $2/grep $3
./gzip.sh $1 $target $2/gzip $3
./make.sh $1 $target $2/make $3
./patch.sh $1 $target $2/patch $3
./sed.sh $1 $target $2/sed $3
./tar.sh $1 $target $2/tar $3
./xz.sh $1 $target $2/xz $3
./binutils-pass-2.sh $1 $target $2/binutils $3
./gcc-pass-1.sh $1 $target $2/gcc $3
cd ..

# Chroot time!
echo "==> Preparing chroot"
sudo ./Misc/prepare-chroot.sh $1
cp -r "Inside Chroot"/* $1/toolchain/

echo "==> Entering chroot"
echo "!> Please run the following command in the chroot to continue <!"
echo "!>   $ /toolchain/inside-chroot.sh <!"
sudo ./Misc/enter-chroot.sh $1

echo "==>> Done! <==="
echo "!> If you'd like to enter chroot again, run the following commands <!"
echo "!>   $ ./Misc/prepare-chroot.sh <mount location> <!"
echo "!>   $ ./Misc/enter-chroot.sh <mount location> <!"