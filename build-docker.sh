#! /usr/bin/env bash

TAGS=( "14.04" "18.04" )

for tag in "${TAGS[@]}"; do
    docker build \
        -t "wpilib/toolchain-builder:$tag" \
        --build-arg BASE="$tag" .
done