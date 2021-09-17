# roborio-toolchain

_Build setup for building the RoboRio Toolchain_

## Building (Windows)
This repo uses Docker on linux in order to build the Windows Compiler. To build, just use the `build-win32.sh` script, which will build the toolchain. The compiler archive will be placed in the root directory as `FRC-YEAR-Window-Toolchain-GccVersion.zip`. The recommended compiler is a 32 bit executable, and has been tested to work on Windows 7 and newer systems. There is also a 64 bit executable for convenience if needed.

## Building (Linux)
This repo uses Docker on linux in order to build the Windows Compiler. To build, just use the `build-linux-tgz.sh` script, which will build the toolchain. The compiler archive will be placed in the root directory as `FRC-YEAR-Linux-Toolchain-GccVersion.tar.gz`. The compiler is built with Ubuntu 14.04, and should be compatible with any system with at least glibc 2.19.

## Building (macOS)
The macOS build must be performed natively on macOS, and has been tested to build correctly on 10.13. To build, just use the `build-linux-tgz.sh` script, which will build the toolchain. The compiler archive will be placed in the root directory as `FRC-YEAR-Mac-Toolchain-GccVersion.tar.gz`.
