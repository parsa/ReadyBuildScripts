#/bin/bash

#++ GCC 4.5.4 Full ++

INSTALL_DIR="$1"
if [ ! -d $INSTALL_DIR ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

PROCESSOR_COUNT=$(($(grep -c processor /proc/cpuinfo) + 2))

set -e

mkdir -p gcc-4.5.4/tmp
cd gcc-4.5.4
wget ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.5.4/gcc-4.5.4.tar.bz2
tar xf gcc-4.5.4.tar.bz2
rm -f gcc-4.5.4.tar.bz2
mv gcc-4.5.4 src
cd src
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2
tar xf gmp-4.3.2.tar.bz2
ln -s gmp-4.3.2 gmp
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2
tar xf mpfr-2.4.2.tar.bz2
ln -s mpfr-2.4.2 mpfr
wget ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz
tar xf mpc-0.8.1.tar.gz
ln -s mpc-0.8.1.tar.gz mpc

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
./configure --prefix=$INSTALL_DIR --with-gmp-prefix=$INSTALL_DIR --enable-interfaces=c,cxx
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
../gcc-4.5.4/configure --prefix="$(dirname $PWD)/build" --program-suffix="-4.5" --with-mpc=$INSTALL_DIR --with-mpfr=$INSTALL_DIR --with-gmp=$INSTALL_DIR --with-ppl=$INSTALL_DIR --with-cloog=$INSTALL_DIR --with-libelf=$INSTALL_DIR --with-libelf=$INSTALL_DIR --enable-languages=c,c++,fortran --enable-tls --enable-static --disable-shared --disable-bootstrap --disable-multilib
make -j33
make -j33 install

