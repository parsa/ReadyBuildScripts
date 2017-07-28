
set -x

source ./sourceme.sh gcc
source ./sourceme.sh mpi
source ./sourceme.sh cmake
source ./sourceme.sh jemalloc
source ./sourceme.sh hwloc
source ./sourceme.sh vc

cd /work/$USER
mkdir build
cd build

git clone https://github.com/STEllAR-GROUP/hpx
cd hpx
git checkout master
git pull
cd ..







rm -r hpx_release
mkdir hpx_release
cd hpx_release
cmake  \
    -DHPX_WITH_THREAD_MANAGER_IDLE_BACKOFF=ON \
    -DHPX_WITH_PARCEL_COALESCING=OFF \
    -DHPX_WITH_PARCELPORT_MPI=ON                                                  \
      -DCMAKE_CXX_COMPILER=mpicxx -DCMAKE_C_COMPILER=mpicc \
      -DCMAKE_CXX_FLAGS="-L$HOME/local/boost/lib " \
      -DCMAKE_C_FLAGS="-L$HOME/local/boost/lib " \
      -DCMAKE_BUILD_TYPE=release                                                                                                                            \
      -DJEMALLOC_ROOT="$HOME/local/jemalloc/"                                                                                                                              \
      -DBOOST_ROOT="$HOME/local/boost/"                                                                                                                              \
      -DHWLOC_ROOT="$HOME/local/hwloc/"                                                                                                                               \
      -DHPX_WITH_TESTS=OFF       \
      -DHPX_WITH_EXAMPLES=OFF                                                                                                                          \
      -DHPX_WITH_MALLOC=jemalloc                                                                                                                         \
      -DCMAKE_INSTALL_PREFIX="$HOME/local/hpx"                                   \
      ../hpx

make -j40 install


