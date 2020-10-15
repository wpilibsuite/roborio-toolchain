#!/bin/sh

docker pull wpilib/toolchain-builder:18.04 \
 && docker run -v ${PWD}:/artifacts wpilib/toolchain-builder:18.04 bash -c "\
  cp /artifacts/download.sh /artifacts/repack.sh /artifacts/versions.sh . \
  && cp -R /artifacts/tools /artifacts/patches /artifacts/linux . \
  && echo 'downloading' && zsh download.sh \
  && zsh repack.sh \
  && cd linux \
  && ./build.sh \
  && cp *.tar.gz /artifacts/"
