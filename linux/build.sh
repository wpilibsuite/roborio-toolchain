#!/bin/bash

make test-cc
make sysroot
sudo cp sysroot-install/usr/local/* /usr/local/ -r
make binutils
sudo cp binutils-install/usr/local/* /usr/local/ -r
make gcc gdb tree tarpkg
