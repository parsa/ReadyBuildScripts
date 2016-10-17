#/bin/bash

#++ GCC 5.1.0 Full ++

INSTALL_DIR="$1"
if [ ! -d $INSTALL_DIR ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

PROCESSOR_COUNT=$(($(grep -c processor /proc/cpuinfo) + 2))

set -e

mkdir -p gcc-5.1.0/tmp
cd gcc-5.1.0
wget ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.1.0/gcc-5.1.0.tar.bz2
tar xf gcc-5.1.0.tar.bz2
#rm -f gcc-5.1.0.tar.bz2
#mv gcc-5.1.0 src
cd gcc-5.1.0
./contrib/download_prerequisites
cd .. # gcc-5.1.0
cd tmp
../gcc-5.1.0/configure --prefix=$INSTALL_DIR --program-suffix="-5.1.0" --enable-languages=c,c++,fortran --enable-tls --enable-static --enable-shared --disable-bootstrap --disable-multilib
#../gcc-5.1.0/configure --with-pkgversion='Centos 6.6 (Final)' --prefix=$INSTALL_DIR --program-suffix="-5.1.0" --enable-languages=c,c++ --enable-static  --enable-shared --enable-linker-build-id --enable-multiarch --with-arch-32=i586 --with-abi=m64 --with-multilib-list=m32,m64,mx32 --with-tune=generic --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
make -j$PROCESSOR_COUNT
make -j$PROCESSOR_COUNT install

