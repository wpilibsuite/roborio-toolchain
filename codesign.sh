#!/bin/bash

sign_directory()
{
    find $1 | while read fname; do
        if [[ -f $fname ]]; then
            echo "[INFO] Signing $fname"
            codesign --force --strict --timestamp --options=runtime -s $2 $fname
        fi
    done
}

cd mac
tar -pxvzf FRC-2020-Mac-Toolchain-7.3.0.tar.gz
sign_directory "frc2020/roborio/bin" $1
sign_directory "frc2020/roborio/arm-frc2020-linux-gnueabi/bin" $1
sign_directory "frc2020/roborio/libexec/gcc/arm-frc2020-linux-gnueabi/7.3.0" $1
tar -pcvzf FRC-2020-Mac-Toolchain-7.3.0.tar.gz frc2020/
rm -rf frc2020/
