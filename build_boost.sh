
source ./sourceme.sh gcc
source ./sourceme.sh mpi
source ./sourceme.sh cmake
source ./sourceme.sh jemalloc
source ./sourceme.sh hwloc
source ./sourceme.sh vc

cd /work/$USER
mkdir build
cd build
if [ ! -f boost_1_64_0.tar.gz ]; then
   wget https://dl.bintray.com/boostorg/release/1.64.0/source/boost_1_64_0.tar.gz
fi
rm -r -f boost_1_64_0
tar -xvf boost_1_64_0.tar.gz
cd boost_1_64_0
./bootstrap.sh --prefix=$HOME/local/boost 
./b2 -j20 install

