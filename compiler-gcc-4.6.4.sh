#/bin/bash

#++ GCC 4.6.4 Full ++
set -e

INSTALL_DIR="${HOME}/tools/gcc/gcc-4.6.4/build"

cd ~/tools
mkdir -p gcc/gcc-4.6.4/{build,tmp}
cd gcc/gcc-4.6.4
curl -O ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.6.4/gcc-4.6.4.tar.bz2
tar xf gcc-4.6.4.tar.bz2
cd gcc-4.6.4/contrib
./download_prerequisites
cd gmp
./configure --prefix=$INSTALL_DIR --disable-shared --enable-static --enable-cxx=yes
make -j33 install
cd .. # gmp
cd mpfr
./configure --prefix=$INSTALL_DIR --disable-shared --enable-static --with-gmp=$INSTALL_DIR
make -j33 install
cd .. # mpfr
cd mpc
./configure --prefix=$INSTALL_DIR --disable-shared --enable-static --with-gmp=$INSTALL_DIR --with-mpfr=$INSTALL_DIR
make -j33 install
cd .. # mpc
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/ppl-0.11.tar.gz
tar xf ppl-0.11.tar.gz
cd ppl-0.11
./configure --prefix=$INSTALL_DIR --with-gmp-prefix=$INSTALL_DIR --enable-interfaces=c,cxx
make -j33 install
cd .. # ppl
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/cloog-ppl-0.15.11.tar.gz
tar xf cloog-ppl-0.15.11.tar.gz
cd cloog-ppl-0.15.11
./configure --prefix=$INSTALL_DIR --with-ppl=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-bits=gmp
make -j33 install
cd .. # cloog-ppl
cd .. # contrib
cd .. # gcc-4.6.4
cd tmp
../gcc-4.6.4/configure --prefix="$(dirname $PWD)/build" --program-suffix="-4.6" --with-mpc=$INSTALL_DIR --with-mpfr=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-ppl=$INSTALL_DIR --with-cloog=$INSTALL_DIR --enable-languages=c,c++,fortran --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib
make -j33
make -j33 install

