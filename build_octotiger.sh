

set -x

source ./sourceme.sh gcc
source ./sourceme.sh mpi
source ./sourceme.sh cmake
source ./sourceme.sh jemalloc
source ./sourceme.sh hwloc
source ./sourceme.sh vc
source ./sourceme.sh silo


cd /work/$USER
mkdir build
cd build

git clone https://github.com/STEllAR-GROUP/octotiger
cd octotiger
cd ..

rm -r octotiger_build
mkdir octotiger_build
cd octotiger_build



cmake -DCMAKE_PREFIX_PATH="$HOME/local/hpx" \
      -DCMAKE_CXX_COMPILER=mpicxx \
      -DCMAKE_C_COMPILER=mpicc \
      -DCMAKE_CXX_FLAGS="-L$HOME/local/boost/lib -march=native" \
      -DCMAKE_C_FLAGS="-L$HOME/local/boost/lib -march=native" \
      -DCMAKE_BUILD_TYPE=release                                                                                                                              \
      -DCMAKE_INSTALL_PREFIX="$HOME/local/octotiger"                                   \
      -DSilo_INCLUDE_DIR=$HOME/local/silo/include \
      -DSilo_LIBRARY=$HOME/local/silo/lib/libsilo.a \
      ../octotiger

make -j20 install


