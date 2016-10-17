#/bin/bash

#++ GCC 4.9.1 Full ++
set -e

INSTALL_DIR="${HOME}/tools/gcc/gcc-4.9.1/build"

cd ~/tools
mkdir -p gcc/gcc-4.9.1/{build,tmp}
cd gcc/gcc-4.9.1
curl -O ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.1/gcc-4.9.1.tar.bz2
tar xf gcc-4.9.1.tar.bz2
cd gcc-4.9.1/contrib
./download_prerequisites
cd gmp
./configure --prefix=$INSTALL_DIR --enable-cxx=yes
make -j33 install
cd .. # gmp
cd mpfr
./configure --prefix=$INSTALL_DIR --with-gmp=$INSTALL_DIR
make -j33 install
cd .. # mpfr
cd mpc
./configure --prefix=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-mpfr=$INSTALL_DIR
make -j33 install
cd .. # mpc
cd isl
./configure --prefix=$INSTALL_DIR --with-gmp-prefix=$INSTALL_DIR
make -j33 install
cd .. # isl
cd cloog
./configure --prefix=$INSTALL_DIR --with-isl-prefix=$INSTALL_DIR --with-gmp-prefix=$INSTALL_DIR
make -j33 install
cd .. # cloog
cd .. # contrib
cd .. # gcc-4.9.1
cd tmp
../gcc-4.9.1/configure --prefix="$(dirname $PWD)/build" --program-suffix="-4.9" --with-mpc=$INSTALL_DIR --with-mpfr=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-cloog=$INSTALL_DIR --with-isl=$INSTALL_DIR --enable-languages=c,c++,fortran --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib
make -j33
make -j33 install

