#/bin/bash

#++ GCC 4.9.2 Full ++

INSTALL_DIR="$1"
if [ ! -d $INSTALL_DIR ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

PROCESSOR_COUNT=$(($(grep -c processor /proc/cpuinfo) + 2))

set -e

mkdir -p gcc-4.9.2/tmp
cd gcc-4.9.2
wget ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.2/gcc-4.9.2.tar.bz2
tar xf gcc-4.9.2.tar.bz2
#rm -f gcc-4.9.2.tar.bz2
#mv gcc-4.9.2 src
cd gcc-4.9.2
./contrib/download_prerequisites
cd .. # gcc-4.9.2
cd tmp
../gcc-4.9.2/configure --prefix=$INSTALL_DIR --program-suffix="-4.9.2" --enable-languages=c,c++,fortran --enable-tls --enable-static --enable-shared --disable-bootstrap --disable-multilib
#../gcc-4.9.2/configure --with-pkgversion='Centos 6.6 (Final)' --prefix=$INSTALL_DIR --program-suffix="-4.9.2" --enable-languages=c,c++ --enable-static  --enable-shared --enable-linker-build-id --enable-multiarch --with-arch-32=i586 --with-abi=m64 --with-multilib-list=m32,m64,mx32 --with-tune=generic --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
make -j$PROCESSOR_COUNT
make -j$PROCESSOR_COUNT install

