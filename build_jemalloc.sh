source ./sourceme.sh gcc
source ./sourceme.sh mpi
cd /work/$USER
mkdir build
cd build
if [ ! -f jemalloc-4.5.0.tar.bz2 ]; then
   wget https://github.com/jemalloc/jemalloc/releases/download/4.5.0/jemalloc-4.5.0.tar.bz2
fi
rm -r jemalloc-4.5.0
tar -xvf jemalloc-4.5.0.tar.bz2
cd jemalloc-4.5.0
./configure --prefix=$HOME/local/jemalloc --enable-shared=no --enable-static=yes 
make -j20 install


