source ./sourceme.sh gcc
cd /work/$USER
mkdir build
cd build
if [ ! -f mpich-3.2.tar.gz ]; then
	wget http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz
fi
rm -r -f mpich-3.2
tar -xvf mpich-3.2.tar.gz
cd mpich-3.2
./configure --prefix=$HOME/local/mpi --enable-fortran=no 
make -j20 install

