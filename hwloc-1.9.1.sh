#/bin/bash
URL="http://www.open-mpi.org/software/hwloc/v1.9/downloads/hwloc-1.9.1.tar.bz2"
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi
mkdir -p hwloc/tmp
pushd hwloc
wget $URL 2>/dev/null || curl -O $URL
tar xf hwloc-1.9.1.tar.bz2
pushd tmp
../hwloc-1.9.1/configure --prefix=$LOCAL_PATH
# Xeon Phi
#./configure --prefix=$HOME/hwloc-1.9.1-install CC=icc CXX=icpc CFLAGS="-mmic" CXXFLAGS="-mmic" LDFLAGS="-mmic" --host=x86_64-unknown-linux
make install

