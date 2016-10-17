#/bin/bash

#++ GCC 4.4.7 Full ++
set -e

INSTALL_DIR="${HOME}/tools/gcc/gcc-4.4.7/build"

cd ~/tools
mkdir -p gcc/gcc-4.4.7/{build,tmp}
cd gcc/gcc-4.4.7
curl -O ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.4.7/gcc-4.4.7.tar.bz2
tar xf gcc-4.4.7.tar.bz2
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2
tar xf gmp-4.3.2.tar.bz2
cd gmp-4.3.2
./configure --prefix=$INSTALL_DIR --disable-shared --enable-static --enable-cxx=yes
make -j33 install
cd .. # gmp
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2
tar xf mpfr-2.4.2.tar.bz2
cd mpfr-2.4.2
./configure --prefix=$INSTALL_DIR --disable-shared --enable-static --with-gmp=$INSTALL_DIR
make -j33 install
cd .. # mpfr
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz
tar xf mpc-0.8.1.tar.gz
cd mpc-0.8.1
./configure --prefix=$INSTALL_DIR --disable-shared --enable-static --with-gmp=$INSTALL_DIR --with-mpfr=$INSTALL_DIR
make -j33 install
cd .. # mpc
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/ppl-0.11.tar.gz
tar xf ppl-0.11.tar.gz
cd ppl-0.11
./configure --prefix=$INSTALL_DIR --with-gmp-prefix=$INSTALL_DIR --enable-shared=no --enable-static --enable-interfaces=c,cxx
make -j33 install
cd .. # ppl
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/cloog-ppl-0.15.11.tar.gz
tar xf cloog-ppl-0.15.11.tar.gz
cd cloog-ppl-0.15.11
./configure --prefix=$INSTALL_DIR --with-ppl=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-bits=gmp
make -j33 install
cd .. # cloog-ppl
curl -O http://www.mr511.de/software/libelf-0.8.13.tar.gz
tar xf libelf-0.8.13.tar.gz
cd libelf-0.8.13
./configure --prefix=$INSTALL_DIR --disable-shared --enable-static
cd .. # libelf
cd tmp
../gcc-4.4.7/configure --prefix="$(dirname $PWD)/build" --program-suffix="-4.6" --with-mpc=$INSTALL_DIR --with-mpfr=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-ppl=$INSTALL_DIR --with-cloog=$INSTALL_DIR --with-libelf=$INSTALL_DIR --with-libelf=$INSTALL_DIR --enable-languages=c,c++,fortran --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib
make -j33
make -j33 install

