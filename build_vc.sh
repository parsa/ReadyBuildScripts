

set -x
source ./sourceme.sh gcc
source ./sourceme.sh mpi
source ./sourceme.sh cmake

cd /work/$USER
mkdir build
cd build

git clone https://github.com/VcDevel/Vc

rm -r vc_build
mkdir vc_build
cd vc_build
cmake \
      -DCMAKE_C_COMPILER=gcc \
      -DCMAKE_CXX_COMPILER=g++ \
      -DCMAKE_BUILD_TYPE=release                                                                                                                               \
      -DBUILD_TESTING=OFF \                                                                                                                               \
      -DCMAKE_INSTALL_PREFIX="$HOME/local/vc"                                   \
       ../Vc

make -j20 install


