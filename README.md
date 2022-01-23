# yiffOS toolchain
The toolchain that is used to build yiffOS.

You'll need a working clang + gcc setup on the host system to run these scripts.

To allow the scripts to find the sources, please ensure the extracted sources are in a folder with only it's name as the folder name. (Example: gcc 11.2.0 would be in /sources/gcc)

A destination folder will need to be created to allow the toolchain to properly link.

After the script completes, you'll be able to chroot into a yiffOS environment to compile software.

Script Usage:  
`./create-toolchain.sh "destination folder" "source folder" "makeflags"`
