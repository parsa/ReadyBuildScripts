#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p cmake/tmp
pushd cmake/
wget https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz
tar xf cmake-3.5.2.tar.gz
pushd tmp
../cmake-3.6.2/configure --prefix=$LOCAL_PATH --parallel=$PROCESSOR_COUNT
make $LOCAL_MAKEFLAGS install

