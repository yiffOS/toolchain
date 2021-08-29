# yiffOS toolchain
The toolchain that is used to build yiffOS.

You'll need a working clang + gcc setup on the host system to run these scripts.
 
You'll also need the sources for:
* binutils 2.36.1
* gcc 10.2.0
* linux 5.13.13
* glibc 2.33 with [this patch](https://www.linuxfromscratch.org/patches/downloads/glibc/glibc-2.33-fhs-1.patch)
* openssl 1.1.1l
* cmake 3.21.1
* llvm 12.0.1
* clang 12.0.1
* compiler-rt 12.0.1
* libcxx 12.0.1
* libcxxabi 12.0.1
 
To allow the scripts to find the sources, please ensure the extracted sources are in a folder with only it's name as the folder name. (Example: gcc 10.2.0 would be in /sources/gcc)

A destination folder will need to be created to allow the toolchain to properly link.	

Script Usage:  
`./create-toolchain.sh "destination folder" "source folder" "makeflags"`
