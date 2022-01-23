#! /bin/bash

echo "########"
echo "Building: glibc"
echo "########"
echo "Mount: $1"
echo "Target: $2"
echo "Source: $3"
echo "Makeflags: $4"
echo "########"


cd $3

case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $1/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $1/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $1/lib64/ld-lsb-x86-64.so.3
    ;;
esac

patch -Np1 -i ./glibc-2.34-fhs-1.patch

mkdir -v build
cd build

../configure                             \
      --prefix=/usr                      \
      --host=$2                          \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$1/usr/include      \
      libc_cv_slibdir=/lib


make $4
make DESTDIR=$1 install

sed '/RTLDLIST=/s@/usr@@g' -i $1/usr/bin/ldd

echo "########"
echo "Testing glibc and gcc" 
echo "########"
echo 'int main(){}' > dummy.c
$2-gcc dummy.c
readelf -l a.out | grep '/ld-linux'
echo "########"
echo "Please check if the above content is [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2] or [Requesting program interpreter: /lib64/ld-linux.so.2]"
read -p "Press any key if it matches, exit the script if it doesn't."

$1/tools/libexec/gcc/$2/11.2.0/install-tools/mkheaders