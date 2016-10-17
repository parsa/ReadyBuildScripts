#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi
mkdir -p jemalloc
pushd jemalloc
wget https://github.com/jemalloc/jemalloc/releases/download/4.0.1/jemalloc-4.0.1.tar.bz2 -O jemalloc-4.0.1.tar.bz2 --content-disposition
tar xf jemalloc-4.0.1.tar.bz2
pushd jemalloc-4.0.1
./configure --prefix=$LOCAL_PATH
make install

