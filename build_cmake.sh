source ./sourceme.sh gcc
cd /work/$USER
mkdir build
cd build
if [ ! -f cmake-3.8.2.tar.gz ]; then
	wget https://cmake.org/files/v3.8/cmake-3.8.2.tar.gz
fi
rm -r -f cmake-3.8.2
tar -xvf cmake-3.8.2.tar.gz
cd cmake-3.8.2
./configure --prefix=$HOME/local/cmake/ 
make -j20 install

