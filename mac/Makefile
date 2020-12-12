export FRCTARGET ?= Mac
export FRCHOSTTARGET ?=
export FRCPREFIX ?= /usr/local
export M = ${PWD}

export PATH:="${PWD}/gcc-install/usr/bin:${PWD}/binutils-install/usr/bin:${PATH}"
export CC=/usr/local/bin/gcc-6
export CXX=/usr/local/bin/g++-6
export CPP=/usr/local/bin/cpp-6
export LD=/usr/local/bin/gcc-6
alias c++=${CPP} # cpp-6
alias g++=${CXX} # g++-6
alias cpp=${CPP} # cpp-6
alias gcc=${CC} # gcc-6
alias ld=${CC} # gcc-6
alias cc=${CC} # gcc-6

%:
	${MAKE} -C ../makes $@

clean:
	$(MAKE) -C ../makes $@
	rm -rf makes/pkg/build
