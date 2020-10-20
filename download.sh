#! /bin/bash
source versions.sh
source tools/verify.sh

gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 3AB00996FC26A641 # gcc
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys C3126D3B4AE55E93 # binutils
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 980C197698C3739D # mpfr
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys F7D5C9BF765C61E3 # mpc
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys F3599FF828C67298 # gmp
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 92EDB04BFF325CF3 # gdb
gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys B00BC66A401A1600 # expat

signed sig https://ftp.gnu.org/gnu/gcc/gcc-${V_GCC}/gcc-${V_GCC}.tar.gz
signed sig https://ftp.gnu.org/gnu/binutils/binutils-${V_BIN}.tar.bz2
signed sig https://ftp.gnu.org/gnu/mpfr/mpfr-${V_MPFR}.tar.bz2
signed sig https://ftp.gnu.org/gnu/mpc/mpc-${V_MPC}.tar.gz
signed sig https://ftp.gnu.org/gnu/gmp/gmp-${V_GMP}.tar.bz2
signed sig https://ftp.gnu.org/gnu/gdb/gdb-${V_GDB}.tar.gz

# Will skip if Vw_EXPAT is 2.2.0 as it is not signed, but 2.2.6 is signed
signed asc https://sourceforge.net/projects/expat/files/expat/${Vw_EXPAT}/expat-${Vw_EXPAT}.tar.bz2

# signed asc https://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/Packages
# Cannot find public key to verify Packages.asc in directory, use https instead
wget -nc -nv https://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/Packages || exit 1

signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/gcc_${Va_GCC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libgcc1_${Va_LIBGCC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libgcc-s-dbg_${Va_LIBGCC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libgcc-s-dev_${Va_LIBGCC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libstdc++6_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libstdc++-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libatomic1_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libatomic-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libgomp1_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libgomp-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libitm1_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libitm-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libssp0_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libssp-dev_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/gcc-runtime-dbg_${Va_LIBSTDCPP}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libc6_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libc6-dbg_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libc6-dev_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/linux-libc-headers-dev_${Va_LINUX}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libcidn1_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libc6-thread-db_${Va_LIBC}_cortexa9-vfpv3.ipk
signed-ni http://download.ni.com/ni-linux-rt/feeds/2019/arm/cortexa9-vfpv3/libc6-extra-nss_${Va_LIBC}_cortexa9-vfpv3.ipk

rm Packages

wget -nc -nv \
    http://www.bastoul.net/cloog/pages/download/cloog-${V_CLOOG}.tar.gz \
    http://isl.gforge.inria.fr/isl-${V_ISL}.tar.bz2