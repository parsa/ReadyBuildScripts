#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p papi/build
pushd papi/
wget http://icl.cs.utk.edu/projects/papi/downloads/papi-5.4.0.tar.gz
tar xf papi-5.4.0.tar.gz
pushd papi-5.4.0/src
./configure --prefix=$LOCAL_PATH
# Xeon Phi
#./configure --prefix=$HOME/papi-5.4.0-install CC=icc CXX=icpc CFLAGS="-mmic" CXXFLAGS="-mmic" LDFLAGS="-mmic" --host=x86_64-unknown-linux
#./configure --prefix=$HOME/papi-5.4.0-install --with-arch=k1om --host=x86_64-k1om-linux --without-ffsll --with-walltimer=clock_realtime_hr --with-perf-events --with-tls=__thread --with-virtualtimer=cputime_id 
make $LOCAL_MAKEFLAGS
make $LOCAL_MAKEFLAGS install

