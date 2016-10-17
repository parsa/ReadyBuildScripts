#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p zlib/build
pushd zlib
curl -O http://zlib.net/zlib-1.2.8.tar.xz
tar xf zlib-1.2.8.tar.xz
pushd zlib-1.2.8
./configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

