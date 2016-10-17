#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p cmake/{build,tmp}
pushd cmake/
curl -O http://www.cmake.org/files/v3.0/cmake-3.0.2.tar.gz
tar xf cmake-3.0.2.tar.gz
cd tmp
../cmake-3.0.2/configure --prefix=$LOCAL_PATH --parallel=$PROCESSOR_COUNT
make $LOCAL_MAKEFLAGS install

