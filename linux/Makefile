export FRCTARGET ?= Linux
export FRCHOSTTARGET ?= x86_64-linux-gnu
export FRCPREFIX ?= /usr/local
export M = ${PWD}

export PATH:="${PWD}/gcc-install/usr/bin:${PWD}/binutils-install/usr/bin:${PATH}"

all:
	$(MAKE) -C ../makes/ $@

%:
	$(MAKE) -C ../makes/ $@