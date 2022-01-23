#! /bin/bash


echo "=> Building: Linux API headers"
echo "> Mount: $1"
echo "> Target: $2"
echo "> Source: $3"
echo "> Makeflags: $4"


cd $3

make mrproper

make $4 headers

find usr/include -name '.*' -delete
rm usr/include/Makefile

cp -rv usr/include $1/usr
