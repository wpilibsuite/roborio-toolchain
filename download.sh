#! /bin/zsh
source versions.sh
source tools/verify.sh

PUB_KEYS=(
    3AB00996FC26A641 # gcc
    C3126D3B4AE55E93 # binutils
    980C197698C3739D # mpfr
    F7D5C9BF765C61E3 # mpc
    F3599FF828C67298 # gmp
    92EDB04BFF325CF3 # gdb
)

for KEY in "${PUB_KEYS[@]}"
do
    # Dont Attempt import if it already exists
    gpg --list-key "0x$KEY" > /dev/null 2>&1 && continue

    # Enfoce https fetch
    wget -nv -O - "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x${KEY}" | \
        gpg --import || { echo "Could not import 0x${KEY} into gpg"; exit 1; }
done

signed sig https://ftp.gnu.org/gnu/gcc/gcc-${V_GCC}/gcc-${V_GCC}.tar.gz
signed sig https://ftp.gnu.org/gnu/binutils/binutils-${V_BIN}.tar.bz2
signed sig https://ftp.gnu.org/gnu/mpfr/mpfr-${V_MPFR}.tar.bz2
signed sig https://ftp.gnu.org/gnu/mpc/mpc-${V_MPC}.tar.gz
signed sig https://ftp.gnu.org/gnu/gmp/gmp-${V_GMP}.tar.bz2
signed sig https://ftp.gnu.org/gnu/gdb/gdb-${V_GDB}.tar.gz

wget -nc -nv https://sourceforge.net/projects/expat/files/expat/${Vw_EXPAT}/expat-${Vw_EXPAT}-RENAMED-VULNERABLE-PLEASE-USE-2.3.0-INSTEAD.tar.bz2
mv expat-${Vw_EXPAT}-RENAMED-VULNERABLE-PLEASE-USE-2.3.0-INSTEAD.tar.bz2 \
    expat-${Vw_EXPAT}.tar.bz2

# signed asc https://download.ni.com/ni-linux-rt/feeds/2021.0/arm/cortexa9-vfpv3/Packages
# Cannot find public key to verify Packages.asc in directory, use https instead
wget -nc -nv https://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/Packages || exit 1

signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/gcc_${Va_GCC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libgcc1_${Va_LIBGCC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libgcc-s-dbg_${Va_LIBGCC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libgcc-s-dev_${Va_LIBGCC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libstdc++6_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libstdc++-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libatomic1_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libatomic-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libgomp1_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libgomp-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libitm1_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libitm-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libssp0_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libssp-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/gcc-runtime-dbg_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libc6_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libc6-dbg_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libc6-dev_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/linux-libc-headers-dev_${Va_LINUX}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libcidn1_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libc6-thread-db_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2021.0/arm/main/cortexa9-vfpv3/libc6-extra-nss_${Va_LIBC}_cortexa9-vfpv3.ipk

rm Packages

wget -nc -nv \
    http://www.bastoul.net/cloog/pages/download/cloog-${V_CLOOG}.tar.gz \
    http://isl.gforge.inria.fr/isl-${V_ISL}.tar.bz2
