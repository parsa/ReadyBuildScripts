#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi
mkdir -p jemalloc
pushd jemalloc
wget http://www.canonware.com/download/jemalloc/jemalloc-3.6.0.tar.bz2
tar xf jemalloc-3.6.0.tar.bz2
pushd jemalloc-3.6.0
./configure --prefix=$LOCAL_PATH
make install

