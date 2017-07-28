source ./sourceme.sh gcc
source ./sourceme.sh cmake
cd /work/$USER
mkdir build
cd build
if [ ! -f silo-4.10.2.tar.gz ]; then
	wget https://wci.llnl.gov/content/assets/docs/simulation/computer-codes/silo/silo-4.10.2/silo-4.10.2.tar.gz
fi
rm -r -f silo-4.10.2
tar -xvf silo-4.10.2.tar.gz
cd silo-4.10.2
./configure --prefix=$HOME/local/silo/ 
make -j20 install

