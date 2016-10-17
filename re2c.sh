#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 0
fi

mkdir re2c
pushd re2c
curl -O https://downloads.sf.net/project/re2c/re2c/0.13.7.5/re2c-0.13.7.5.tar.gz
tar xf re2c-0.13.7.5.tar.gz
pushd re2c-0.13.7.5
./configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS
make $LOCAL_MAKEFLAGS install

