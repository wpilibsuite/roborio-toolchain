include ../versions.sh
export FRCTARGET ?= Windows
export FRCHOSTTARGET ?= i686-w64-mingw32
export FRCPREFIX ?= /c/Users/Public/frc${V_YEAR}/roborio
export M = ${PWD}

all: clean test-cc sysroot binutils gcc gdb tree zip

expat:
	tar xf ../expat-$(Vw_EXPAT).tar.bz2
	V_YEAR=$(V_YEAR) Vw_EXPAT=$(Vw_EXPAT) ../makes/src/expat

gdb: expat
	$(MAKE) -C ../makes $@

clean:
	$(MAKE) -C ../makes $@
	rm -rf expat* *-Toolchain-*.zip

zip:
	cd tree-install/c/Users/Public && zip -r ../../../../FRC-$(V_YEAR)-$(FRCTARGET)-Toolchain-$(V_GCC).zip .

%:
	$(MAKE) -C ../makes $@