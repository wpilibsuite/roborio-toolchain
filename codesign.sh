#!/bin/bash
source versions.sh

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
tar -pxvzf FRC-${V_YEAR}-Mac-Toolchain-${V_GCC}.tar.gz
sign_directory "frc${V_YEAR}/roborio/bin" $1
sign_directory "frc${V_YEAR}/roborio/arm-frc${V_YEAR}-linux-gnueabi/bin" $1
sign_directory "frc${V_YEAR}/roborio/libexec/gcc/arm-frc${V_YEAR}-linux-gnueabi/${V_GCC}" $1
tar -pcvzf FRC-${V_YEAR}-Mac-Toolchain-${V_GCC}.tar.gz frc${V_YEAR}/
rm -rf frc${V_YEAR}/
