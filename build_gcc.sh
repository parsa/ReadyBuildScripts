module load gcc
archive=gcc-7_1_0-release.tar.gz
cd /work/$USER
mkdir build
cd build
if [ ! -f $archive ]; then
	wget https://github.com/gcc-mirror/gcc/archive/$archive
fi
rm -r -f gcc-gcc-7_1_0-release
tar -xvf $archive
cd gcc-gcc-7_1_0-release
./contrib/download_prerequisites
./configure --prefix=$HOME/local/gcc/ --with-local-prefix=$HOME/local/gcc/ --enable-languages=c,c++,fortran,lto --enable-lto --enable-checking=release --disable-multilib --enable-shared=yes --enable-static=yes --enable-threads=posix --enable-gold=default --enable-plugins --enable-ld --with-plugin-ld=ld.gold --enable-bootstrap
make -j20
make -j20 install
module unload gcc

