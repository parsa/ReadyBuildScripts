source ./sourceme.sh gcc
source ./sourceme.sh mpi
cd /work/$USER
mkdir build
cd build
if [ ! -f hwloc-1.11.7.tar.gz ]; then
	wget https://www.open-mpi.org/software/hwloc/v1.11/downloads/hwloc-1.11.7.tar.gz
fi
rm -r -f hwloc-1.11.7
tar -xvf hwloc-1.11.7.tar.gz
cd hwloc-1.11.7
./configure --prefix=$HOME/local/hwloc
make -j20 install

