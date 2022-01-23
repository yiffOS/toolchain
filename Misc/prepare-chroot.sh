#!/bin/bash

# Ensure correct file permissions
chown -R root:root $1/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -R root:root $1/lib64 ;;
esac

# Create inital system folders
mkdir -pv $1/{dev,proc,sys,run}

# Create device nodes
mknod -m 600 $1/dev/console c 5 1
mknod -m 666 $1/dev/null c 1 3

# Mount and populate /dev
mount -v --bind /dev $1/dev

# Mount VKFS
mount -v --bind /dev/pts $1/dev/pts
mount -vt proc proc $1/proc
mount -vt sysfs sysfs $1/sys
mount -vt tmpfs tmpfs $1/run

if [ -h $1/dev/shm ]; then
  mkdir -pv $1/$(readlink $1/dev/shm)
fi

# Create /toolchain folder
mkdir -pv $1/toolchain